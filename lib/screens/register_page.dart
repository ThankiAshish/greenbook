import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/screens/login_page.dart';
import 'package:greenbook/services/auth_services.dart';
import 'package:greenbook/utils/utils.dart';
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
            'Register',
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
              GestureDetector(
                onTap: () async {
                  pickedFile = await picker.pickImage(source: ImageSource.gallery);
                  if(pickedFile != null) {
                    File imageFile = File(pickedFile.path);
                    imagePath = imageFile.path;
                  setState(() {});
                  }
                },
                child: Stack(
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
                          image: imagePath == "" ? const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049_640.png'
                              )
                          ) : DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.file(File(imagePath)).image
                          ),
                      ),
                    ), 
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const IconButton(
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
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    hintText: 'Username',
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
                  controller: nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    hintText: 'Name',
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
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    hintText: 'Confirm Password',
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
              height: 20,
            ),
            SizedBox(
              width: 325,
              height: 60,
              child: ElevatedButton(
                onPressed: (){
                  if(imagePath == null || usernameController.text.isEmpty || nameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty) {
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
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already Have an Account? ', 
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const LoginPage(),),);
                  },
                  child: Text(
                    'Login', 
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
}