import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
    {
      Key? key,
      required this.controller,
      required this.keyboardType,
      required this.labelText,
      this.hintText,
      this.obsecureText,
      this.obsecuringCharacter,
      this.fillColor,
      this.hintColor,
      this.maxLines
    }
  )
  : super(key: key);

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labelText;
  final bool? obsecureText;
  final String? obsecuringCharacter;
  final String? hintText;
  final Color? hintColor;
  final Color? fillColor;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        obscureText: obsecureText ?? false,
        obscuringCharacter: obsecuringCharacter ?? '*',
        decoration: InputDecoration(
          filled: true,
          // fillColor: fillColor ?? Colors.white.withOpacity(0.8),
          labelText: labelText,
          // hintStyle: TextStyle(color: hintColor ?? Colors.grey),
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            // borderSide: BorderSide.none,
          ),
        ),         
      ),
    );
  }
}