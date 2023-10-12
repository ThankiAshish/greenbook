import 'dart:io';

import 'package:flutter/material.dart';

class CustomImagePicker extends StatelessWidget {
  const CustomImagePicker(
    {
      Key? key,
      required this.imagePath,
      required this.onTap
    }
  ) :
  super(key: key);

  final dynamic imagePath;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
                border: Border.all(width: 4, color: Colors.white),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1))
                ],
                shape: BoxShape.circle,
                image: imagePath == "" ? const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049_640.png'
                    )
                ) : DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.file(File(imagePath)).image
                ),
            ),
          ), 
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: null,
              ),
            ),
          )
        ],
      ),
    );
  }
}