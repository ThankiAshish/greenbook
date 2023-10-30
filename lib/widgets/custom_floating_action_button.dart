import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/screens/donate_page.dart';

import '../screens/gardeners_page.dart';
import '../screens/home_page.dart';
import '../screens/leaderboard_page.dart';
import '../screens/profile_page.dart';
import '../screens/settings_page.dart';

class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton({super.key});

  @override
  State<CustomFloatingActionButton> createState() => _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState extends State<CustomFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.menu),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: Stack(
                children: [
                  Positioned(
                    right: 20,
                    top: 20,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close),
                    ),
                  ),
                  Positioned(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    top: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (ctx) => const HomePage()));
                          },
                          child: Text(
                            "Home",
                            style: GoogleFonts.manrope(
                              textStyle: const TextStyle(
                                color: Color(0xFF20411B),
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 2,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (ctx) => const ProfilePage()));
                          },
                          child: Text(
                            "Profile",
                            style: GoogleFonts.manrope(
                              textStyle: const TextStyle(
                                color: Color(0xFF20411B),
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 2,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (ctx) => const GardenersPage()));
                          },
                          child: Text(
                            "Garderners",
                            style: GoogleFonts.manrope(
                              textStyle: const TextStyle(
                                color: Color(0xFF20411B),
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 2,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        // TextButton(
                        //   onPressed: () {
                        //     Navigator.of(context).push(
                        //         MaterialPageRoute(builder: (ctx) => const DonatePage()));
                        //   },
                        //   child: Text(
                        //     "Donate",
                        //     style: GoogleFonts.manrope(
                        //       textStyle: const TextStyle(
                        //         color: Color(0xFF20411B),
                        //         fontSize: 20,
                        //         fontWeight: FontWeight.w400,
                        //         letterSpacing: 2,
                        //         height: 0,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (ctx) => const LeaderboardPage()));
                          },
                          child: Text(
                            "Leaderboard",
                            style: GoogleFonts.manrope(
                              textStyle: const TextStyle(
                                color: Color(0xFF20411B),
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 2,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (ctx) => const SettingsPage()));
                          },
                          child: Text(
                            "Settings",
                            style: GoogleFonts.manrope(
                              textStyle: const TextStyle(
                                color: Color(0xFF20411B),
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 2,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
