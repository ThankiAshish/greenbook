import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
    {
      Key? key,
      required this.controller,
      required this.fillColor,
      required this.hintText,
      required this.hintColor,
      required this.keyboardType,
      this.obsecureText,
      this.obsecuringCharacter,
    }
  )
  : super(key: key);

  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool? obsecureText;
  final String? obsecuringCharacter;
  final String hintText;
  final Color? hintColor;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obsecureText ?? false,
        obscuringCharacter: obsecuringCharacter ?? '*',
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor ?? Colors.white.withOpacity(0.8),
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor ?? Colors.grey),
          contentPadding: const EdgeInsets.all(20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),         
      ),
    );
  }
}