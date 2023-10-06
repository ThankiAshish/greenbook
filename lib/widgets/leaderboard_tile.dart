import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaderboardTile extends StatefulWidget {
  const LeaderboardTile({super.key});

  @override
  State<LeaderboardTile> createState() => _LeaderboardTileState();
}

class _LeaderboardTileState extends State<LeaderboardTile> {
  @override
  Widget build(BuildContext context) {
    return 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: 360,
          height: 60,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(5, -0.16),
              end: Alignment(-5, 0.16),
              colors: [Color(0xFF306028), Color(0x0051FF00)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '1',
                style: GoogleFonts.manrope(
                  color: const Color(0xFF20411B),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: 1.40,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '869',
                style: GoogleFonts.manrope(
                  color: const Color(0xFF20411B),
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  height: 0,
                  letterSpacing: 1.40,
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 40,
                    height: 40,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/user.png')
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'John Doe',
                        style: GoogleFonts.manrope(
                          color: const Color(0xFF000066),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 1.20,
                        ),
                      ),
                      Text(
                        '@johndoe',
                        style: GoogleFonts.manrope(
                          color: const Color(0xFF20411B),
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          height: 0,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
  }
}