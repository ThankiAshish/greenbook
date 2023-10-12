import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/screens/register_page.dart';
import 'package:greenbook/services/auth_services.dart';
import 'package:greenbook/utils/utils.dart';
import 'package:greenbook/widgets/custom_primary_outlined_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  final AuthService authService = AuthService();

  void loginUser() {
    authService.loginUser(
      context: context, 
      email: emailController.text, 
      password: passwordController.text
    );
  }

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
            'Login',
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
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                "assets/images/login.png",
                width: 220,
                height: 220,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                "Please Verify it's You",
                style: GoogleFonts.manrope(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 2.40,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.all(20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),         
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.all(20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),         
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              CustomPrimaryOutlinedButton(
                text: 'Login', 
                width: 325, 
                height: 60, 
                textSize: 18, 
                borderColor: const Color(0xFF000066), 
                textColor: const Color(0xFF000066), 
                onPressed: loginButtonOnClick
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have an Account ? ", 
                    style: GoogleFonts.manrope(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 1.40,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const RegisterPage(),),);
                    },
                    child: Text(
                      'Register', 
                      style: GoogleFonts.manrope(
                        color: const Color(0xFF000066),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 0,
                        letterSpacing: 1.40,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  loginButtonOnClick () {
    if(emailController.text.isEmpty || passwordController.text.isEmpty) {
      showSnackBar(
        context,
        'All Fields are Required!'
      );
    }
    loginUser();
  }
}