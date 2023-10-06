import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/widgets/leaderboard_header.dart';
import 'package:greenbook/widgets/leaderboard_tile.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.34202014, -1.3),
          end: Alignment(-0.11, 10.0),
          colors: [Colors.white, Color(0x66D3FF76)],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Text(
            'Leaderboard',
            style: GoogleFonts.manrope(
              color: const Color(0xFF000066),
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 0,
              letterSpacing: 2,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const LeaderboardHeader(),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 360,
              height: 1,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  scrollDirection: Axis.vertical,
                  children: [
                    for(int i = 0; i < 20; i++)
                      GestureDetector(
                        onTap: null,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: const LeaderboardTile(),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}