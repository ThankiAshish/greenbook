// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/widgets/custom_floating_action_button.dart';
import 'package:greenbook/widgets/custom_primary_filled_button.dart';
import 'package:greenbook/widgets/custom_text_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

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
            "Change Password",
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


        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Create new Password',
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
                  
                  CustomTextField(
                  controller: oldPasswordController, 
                  keyboardType: TextInputType.text, 
                  labelText: "Old password"
                  ),
        
                  SizedBox(
                    height: 20,
                  ),
        
                  CustomTextField(
                  controller: newPasswordController, 
                  keyboardType: TextInputType.text,
                  obsecureText: true, 
                  labelText: "New password"
                  ),
        
                  SizedBox(
                    height: 30,
                  ),
        
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomPrimaryFilledButton(
                    text: "Save", 
                    width: 280, 
                    height: 50, 
                    textSize: 18, 
                    color: Colors.red,
                    onPressed: (){
        
                    })
                  ),
                ],
              ),
            ),
          ),
        ),
        
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom:20,right: 20),
        child: CustomFloatingActionButton(),
      ),
      ),
    );
  }
}
