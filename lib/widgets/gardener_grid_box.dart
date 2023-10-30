import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GardenerGridBox extends StatefulWidget {
  const GardenerGridBox({super.key});

  @override
  State<GardenerGridBox> createState() => _GardenerGridBoxState();
}

class _GardenerGridBoxState extends State<GardenerGridBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 100,
      decoration: ShapeDecoration(
        color: Colors.green.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 50,
            height: 50,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/user.png')
            ),
          ),
          Text(
            'Username',
            style: GoogleFonts.manrope(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              height: 0,
              letterSpacing: 0.50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: SizedBox(
              height: 25,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Following',
                  style: GoogleFonts.manrope(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}