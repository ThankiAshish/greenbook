import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/screens/login_page.dart';
import 'package:greenbook/services/auth_services.dart';
import 'package:greenbook/utils/utils.dart';
import 'package:greenbook/widgets/custom_image_picker.dart';
import 'package:greenbook/widgets/custom_primary_filled_button.dart';
import 'package:greenbook/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  
  var picker = ImagePicker();
  late dynamic pickedFile;
  late dynamic imagePath;

  final AuthService authService = AuthService();

  void registerUser() {
    authService.registerUser(
      context: context, 
      name: nameController.text, 
      email: emailController.text, 
      username: usernameController.text, 
      password: passwordController.text,
      profilePicture: imagePath
    );
  }

  @override
  void initState() {
    imagePath = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Register',
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
            CustomImagePicker(
              imagePath: imagePath, 
              onTap: imagePickerOnClick,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              controller: usernameController, 
              labelText: 'Username', 
              keyboardType: TextInputType.text
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: nameController, 
              labelText: 'Name', 
              keyboardType: TextInputType.text
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: emailController, 
              labelText: 'Email', 
              keyboardType: TextInputType.emailAddress
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: passwordController, 
              labelText: 'Password', 
              keyboardType: TextInputType.text,
              obsecureText: true,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: confirmPasswordController, 
              labelText: 'Confirm Password', 
              keyboardType: TextInputType.text,
              obsecureText: true,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomPrimaryFilledButton(
              text: 'Create Account', 
              color: const Color(0xFF000066), 
              width: 325, 
              height: 60, 
              textColor: const Color(0xFFF3F3F3), 
              textSize: 18, 
              onPressed: registerButtonOnClick
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
          'Already Have an Account? ', 
          style: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 0,
            letterSpacing: 1.40,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> const LoginPage(),),);
          },
          child: Text(
            'Login', 
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

  void registerButtonOnClick (){
    if(
      imagePath == null || 
      usernameController.text.isEmpty || 
      nameController.text.isEmpty || 
      emailController.text.isEmpty || 
      passwordController.text.isEmpty
    ) {
      showSnackBar(
        context, 
        'All Fields are Required!'
      );
    } else {
      if(passwordController.text == confirmPasswordController.text) {
        registerUser();
      } else {
        showSnackBar(
          context, 
          'Passwords do not match'
        );
      }
    }
  }

  void imagePickerOnClick () async {
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null) {
      File imageFile = File(pickedFile.path);
      imagePath = imageFile.path;
      setState(() {});
    }
  }
}