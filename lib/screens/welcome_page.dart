import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/screens/login_page.dart';
import 'package:greenbook/screens/register_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
        backgroundColor: Colors.transparent,
        body: Column(children: [
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
                    color: const Color(0xFF000066),
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
                    color: Colors.black,
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
          SizedBox(
            width: 300,
            height: 60,
            child: ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const RegisterPage(),),);
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF000066)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              child: Text(
                'Create Account',
                style: GoogleFonts.manrope(
                  color: const Color(0xFFF3F3F3),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: 1.80,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            height: 60,
            child: OutlinedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const LoginPage(),),);
              },
              style: OutlinedButton.styleFrom(
                shape: const StadiumBorder(),
                side: const BorderSide(width: 1, color: Color(0xFF000066))
              ),
              child: Text(
                'Login',
                style: GoogleFonts.manrope(
                  color: const Color(0xFF000066),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: 1.80,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
