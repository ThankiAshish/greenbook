// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
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
            "Profile Settings",
            style: GoogleFonts.manrope(
              textStyle: TextStyle(color: Colors.black),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
        ),


        
        body: Padding(
          padding: const EdgeInsets.all(45),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Change Details',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 2.30,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049_640.png'))),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                          onPressed: null,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                    decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                  hintText: 'Your name',
                  hintStyle: GoogleFonts.manrope(
                    textStyle: TextStyle(color: Colors.black),
                  ),
                  contentPadding: EdgeInsets.all(20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                )),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your button click action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(0xFF000066), // Button background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 130, vertical: 17), // Button padding
                      ),
                      child: Text(
                        'Save',
                        style: GoogleFonts.manrope(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 2.25,
                          ), // Text color // Text font size
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
