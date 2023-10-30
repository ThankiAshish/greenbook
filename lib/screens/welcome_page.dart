import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/screens/login_page.dart';
import 'package:greenbook/screens/register_page.dart';
import 'package:greenbook/widgets/custom_primary_filled_button.dart';
import 'package:greenbook/widgets/custom_primary_outlined_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Image.asset(
            "assets/images/environment.png",
            width: 408,
            height: 306,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to',
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 1.60,
                  ),
                ),
                Text(
                  'Greenbook',
                  style: GoogleFonts.manrope(
                    color: const Color(0xFF306028),
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 3.20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'We provide the gardeners and you this \nplatform to fuel your passion of \nplantation using the donations.',
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 1.40,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 90,
          ),
          CustomPrimaryFilledButton(
            text: 'Create Account', 
            width: 325, 
            height: 60,  
            textSize: 18, 
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const RegisterPage(),),);
            }
          ),
          const SizedBox(
            height: 10,
          ),
          CustomPrimaryOutlinedButton(
            text: 'Login', 
            width: 325, 
            height: 60, 
            textSize: 18, 
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const LoginPage(),),);
            }
          ),
        ]
      ),
    );
  }
}
