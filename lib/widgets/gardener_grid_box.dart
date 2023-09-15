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
      width: 100,
      height: 100,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          colors: [Color.fromARGB(255, 85, 156, 73), Color(0x0051ff00)],
          stops: [0, 0.99],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
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
              color: const Color(0xFF23401E),
              fontSize: 10,
              fontWeight: FontWeight.w500,
              height: 0,
              letterSpacing: 0.50,
            ),
          ),
          SizedBox(
            height: 25,
            width: 70,
            child: ElevatedButton(
              onPressed: null,
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFC4C4C4)),
              ),
              child: Text(
                'Following',
                style: GoogleFonts.manrope(
                  color: Colors.black,
                  fontSize: 8,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}