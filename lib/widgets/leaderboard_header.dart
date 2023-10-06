import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaderboardHeader extends StatelessWidget {
  const LeaderboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'RANK',
          style: GoogleFonts.manrope(
            color: const Color(0xFF20411B),
            fontSize: 14,
            fontWeight: FontWeight.w700,
            height: 0,
            letterSpacing: 1.40,
          ),
        ),
        Text(
          'PTS.',
          style: GoogleFonts.manrope(
            color: const Color(0xFF20411B),
            fontSize: 14,
            fontWeight: FontWeight.w700,
            height: 0,
            letterSpacing: 1.40,
          ),
        ),
        Text(
          'DONATORS',
          style: GoogleFonts.manrope(
            color: const Color(0xFF20411B),
            fontSize: 14,
            fontWeight: FontWeight.w700,
            height: 0,
            letterSpacing: 1.40,
          ),
        ),
      ],
    );
  }
}