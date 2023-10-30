import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPrimaryFilledButton extends StatelessWidget {
  const CustomPrimaryFilledButton(
    {
      Key? key,
      required this.text,
      required this.width,
      required this.height,
      required this.textSize,
      required this.onPressed,
      this.color,
      this.textColor,
    }
  ) : super(key: key);

  final String text;
  final double width;
  final double height;
  final double textSize;
  final Color? color;
  final Color? textColor;
  final void Function()? onPressed;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          // backgroundColor:
          //     MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.manrope(
            // color: textColor,
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

