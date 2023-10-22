// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/widgets/custom_floating_action_button.dart';
import 'package:greenbook/widgets/custom_image_picker.dart';
import 'package:greenbook/widgets/custom_primary_filled_button.dart';
import 'package:greenbook/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
 
  late dynamic pickedFile;
  late dynamic imagePath;
  var picker = ImagePicker();

  TextEditingController nameController = TextEditingController();

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


        
        body: SingleChildScrollView(
          child: Padding(
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
                  
                  CustomImagePicker(
                    width: 130,
                    height: 130,
                    boxShape: BoxShape.circle,
                    imagePath: imagePath, 
                    onTap: imagePickerOnClick,
                  ),
        
                  SizedBox(
                    height: 30,
                  ),

                  CustomTextField(
                  controller: nameController, 
                  keyboardType: TextInputType.text, 
                  labelText: "Your name"),
             
                  SizedBox(
                    height: 40,
                  ),
        
                  CustomPrimaryFilledButton(
                  text: "Save", 
                  width: 280, 
                  height: 50, 
                  textSize: 18, 
                  onPressed: (){
                    
                  })
            
                ],
              ),
            ),
          ),
        ),



      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom:20,right: 20),
        child: CustomFloatingActionButton()
      ),
    ),
    );   
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


