import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/user.png",
                      width: 120,
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
                  decoration: const BoxDecoration(color: Color(0x541E1E1E)),
                ),
                Container(
                  width: 350,
                  height: 200,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/Nature.png"),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const Text(
                  "daondkawndwnadjid nkwndkjndijndiaw ndiawp dnawidn awdiwan diwiddniawnd iawd nwaidn awidn awidnawidnwa id nwaidndiwan diawndiwandiwand iawdn waiudn awikdn waiud nawiudnawiud awuidawiudiudwandiuan diupawdn iawud nawiudnawiud waidnawidunawidaw uidwaiud awiudawn iudawn diu daondkawndwnadjid nkwndkjndijndiaw ndiawp dnawidn awdiwan diwiddniawnd iawd nwaidn awidn awidnawidnwa id nwaidndiwan diawndiwandiwand iawdn waiudn awikdn waiud nawiudnawiud awuidawiudiudwandiuan diupawdn iawud nawiudnawiud waidnawidunawidaw uidwaiud awiudawn iudawn diu daondkawndwnadjid nkwndkjndijndiaw ndiawp dnawidn awdiwan diwiddniawnd iawd nwaidn awidn awidnawidnwa id nwaidndiwan diawndiwandiwand iawdn waiudn awikdn waiud nawiudnawiud awuidawiudiudwandiuan diupawdn iawud nawiudnawiud waidnawidunawidaw uidwaiud awiudawn iudawn diu ",
                  textAlign: TextAlign.justify,
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
    );
  }
}
