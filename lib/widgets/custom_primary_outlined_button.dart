import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPrimaryOutlinedButton extends StatelessWidget {
  const CustomPrimaryOutlinedButton(
    {
      Key? key,
      required this.text,
      required this.width,
      required this.height,
      required this.textSize,
      required this.borderColor,
      required this.textColor,
      required this.onPressed
    }
  ) : super(key: key);

  final String text;
  final double width;
  final double height;
  final double textSize;
  final Color borderColor;
  final Color textColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: const StadiumBorder(),
          side: BorderSide(width: 1, color: borderColor)
        ),
        child: Text(
          text,
          style: GoogleFonts.manrope(
            color: textColor,
            fontSize: textSize,
            fontWeight: FontWeight.w700,
            height: 0,
            letterSpacing: 1.80,
          ),
        ),
      ),
    );
  }
}