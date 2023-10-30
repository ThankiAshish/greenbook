// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/providers/user_provider.dart';
import 'package:greenbook/screens/account_settings_page.dart';
import 'package:greenbook/screens/profile_settings_page.dart';
import 'package:greenbook/services/auth_services.dart';
import 'package:greenbook/widgets/custom_floating_action_button.dart';
import 'package:greenbook/widgets/custom_primary_filled_button.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();

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
                           Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const ProfileSettings()));
                        },
                        child: Text(
                          'Profile',
                          style: GoogleFonts.manrope(
                            color: Color(0xFF20411B),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                           Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const AccountSettingsPage()));
                        },
                        child: Text(
                          'Account',
                          style: GoogleFonts.manrope(
                            color: Color(0xFF20411B),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {

                        },
                        child: Text(
                          'Notifications',
                          style: GoogleFonts.manrope(
                            color: Color(0xFF20411B),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {

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
                  child: CustomPrimaryFilledButton(
                  text: "Logout", 
                  width: 340, 
                  height: 60, 
                  textSize: 18, 
                  onPressed: (){
                    authService.signOut(context);
                  })
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom:90),
          child: CustomFloatingActionButton()
        ),
      ),
    );
  }
}
