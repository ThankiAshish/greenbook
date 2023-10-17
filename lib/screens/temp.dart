// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/screens/gardeners_page.dart';
import 'package:greenbook/screens/home_page.dart';
import 'package:greenbook/screens/leaderboard_page.dart';
import 'package:greenbook/screens/settings_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
            'My Profile',
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
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/user.png",
                          width: 100,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 190,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'John Doe',
                              style: GoogleFonts.manrope(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                height: 0,
                                letterSpacing: 2.20,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '6.5K',
                                      style: GoogleFonts.manrope(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                        letterSpacing: 1.20,
                                      ),
                                    ),
                                    Text(
                                      'Followers',
                                      style: GoogleFonts.manrope(
                                        color: const Color(0xFF20411B),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300,
                                        height: 0,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '386',
                                      style: GoogleFonts.manrope(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                        letterSpacing: 1.20,
                                      ),
                                    ),
                                    Text(
                                      'Following',
                                      style: GoogleFonts.manrope(
                                        color: const Color(0xFF20411B),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300,
                                        height: 0,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '10',
                                      style: GoogleFonts.manrope(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                        letterSpacing: 1.20,
                                      ),
                                    ),
                                    Text(
                                      'Donations',
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
                      )
                    ],
                  ),
                  Container(
                    width: 350,
                    height: 1,
                    margin: EdgeInsets.all(10),
                    decoration: const BoxDecoration(color: Color(0x541E1E1E)),
                  ),
                  Container(
                    width: 340,
                    height: 200,
                    decoration: ShapeDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/demo.jpg"),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: const Text(
                      "daondkawndwnadjid nkwndkjndijndiaw ndiawp dnawidn awdiwan diwiddniawnd iawd nwaidn awidn awidnawidnwa id nwaidndiwan diawndiwandiwand iawdn waiudn awikdn waiud nawiudnawiud awuidawiudiudwandiuan diupawdn iawud nawiudnawiud waidnawidunawidaw uidwaiud awiudawn iudawn diu daondkawndwnadjid nkwndkjndijndiaw ndiawp dnawidn awdiwan diwiddniawnd iawd nwaidn awidn awidnawidnwa id nwaidndiwan diawndiwandiwand iawdn waiudn awikdn waiud nawiudnawiud awuidawiudiudwandiuan diupawdn iawud nawiudnawiud waidnawidunawidaw uidwaiud awiudawn iudawn diu daondkawndwnadjid nkwndkjndijndiaw ndiawp dnawidn awdiwan diwiddniawnd iawd nwaidn awidn awidnawidnwa id nwaidndiwan diawndiwandiwand iawdn waiudn awikdn waiud nawiudnawiud awuidawiudiudwandiuan diupawdn iawud nawiudnawiud waidnawidunawidaw uidwaiud awiudawn iudawn diu ",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const IconButton(
                            onPressed: null,
                            icon: Icon(Icons.thumb_up),
                          ),
                          Text(
                            'XXKM',
                            style: GoogleFonts.manrope(
                              color: const Color(0xFF23401E),
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: 0.25,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const IconButton(
                            onPressed: null,
                            icon: Icon(Icons.share),
                          ),
                          Text(
                            'Share',
                            style: GoogleFonts.manrope(
                              color: const Color(0xFF23401E),
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: 0.25,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const IconButton(
                            onPressed: null,
                            icon: Icon(Icons.edit),
                          ),
                          Text(
                            'Edit',
                            style: GoogleFonts.manrope(
                              color: const Color(0xFF23401E),
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: 0.25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: FloatingActionButton(
            child: Icon(Icons.menu),
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => const HomePage()));
                                },
                                child: Text(
                                  "Home",
                                  style: GoogleFonts.manrope(
                                    textStyle: TextStyle(
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => const ProfilePage()));
                                },
                                child: Text(
                                  "Profile",
                                  style: GoogleFonts.manrope(
                                    textStyle: TextStyle(
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => const GardenersPage()));
                                },
                                child: Text(
                                  "Garderners",
                                  style: GoogleFonts.manrope(
                                    textStyle: TextStyle(
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) =>
                                          const LeaderboardPage()));
                                },
                                child: Text(
                                  "Donaters Leaderboard",
                                  style: GoogleFonts.manrope(
                                    textStyle: TextStyle(
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) =>
                                          const LeaderboardPage()));
                                },
                                child: Text(
                                  "Gardeners Leaderboard",
                                  style: GoogleFonts.manrope(
                                    textStyle: TextStyle(
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => const SettingsPage()));
                                },
                                child: Text(
                                  "Settings",
                                  style: GoogleFonts.manrope(
                                    textStyle: TextStyle(
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
          ),
        ),
      ),
    );
  }
}
