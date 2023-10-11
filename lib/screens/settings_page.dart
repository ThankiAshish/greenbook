// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool showInvalidAmountMessage = false;
  int currIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.3420201, -1.3),
          end: Alignment(-0.11, 10.0),
          colors: [Colors.white, Color(0x66D3FF76)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Settings",
            style: GoogleFonts.manrope(
              textStyle: TextStyle(color: Colors.black, letterSpacing: 2),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20), // Adjust the height as needed
              Container(
                width: 350,
                height: 500,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.800000011920929),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.4000000059604645),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Add action for Profile button
                        },
                        child: Text(
                          'Profile',
                          style: TextStyle(
                            color: Color(0xFF20411B),
                            fontSize: 20,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Add action for Account button
                        },
                        child: Text(
                          'Account',
                          style: TextStyle(
                            color: Color(0xFF20411B),
                            fontSize: 20,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Add action for Notifications button
                        },
                        child: Text(
                          'Notifications',
                          style: TextStyle(
                            color: Color(0xFF20411B),
                            fontSize: 20,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Add action for Remove Story button
                        },
                        child: Text(
                          'Remove Story',
                          style: TextStyle(
                            color: Color(0xFF660000),
                            fontSize: 20,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

               Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your button click action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF660000),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 130, vertical: 17),
                      ),
                      child: Text(
                        'Logout',
                        style: GoogleFonts.manrope(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 2.25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            SizedBox(
              height: 20,
            )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: currIndex,
          onTap: (int index) {
            setState(() {
              currIndex = index;
            });
          },
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          iconSize: 35.0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
          ],
        ),
      ),
    );
  }
}
