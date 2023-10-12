import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/screens/register_page.dart';
import 'package:greenbook/services/auth_services.dart';
import 'package:greenbook/utils/utils.dart';
import 'package:greenbook/widgets/custom_primary_outlined_button.dart';
import 'package:greenbook/widgets/custom_text_field.dart';

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Login',
          style: GoogleFonts.manrope(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 0,
            letterSpacing: 2,
          ),
        ),
      ),
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
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 2.40,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: emailController, 
              keyboardType: TextInputType.emailAddress, 
              labelText: 'Email'
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: passwordController, 
              keyboardType: TextInputType.text, 
              labelText: 'Password',
              obsecureText: true,
            ),
            const SizedBox(
              height: 80,
            ),
            CustomPrimaryOutlinedButton(
              text: 'Login', 
              width: 325, 
              height: 60, 
              textSize: 18,
              onPressed: loginButtonOnClick
            ),
            const SizedBox(
              height: 20,
            ),
            buttonFooterBuilder(),
          ],
        ),
      ),
    );
  }

  Widget buttonFooterBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't Have an Account ? ", 
          style: GoogleFonts.manrope(
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
              color: Colors.green.shade900,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              height: 0,
              letterSpacing: 1.40,
            ),
          ),
        ),
      ],
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