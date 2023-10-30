// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/providers/user_provider.dart';
import 'package:greenbook/services/user_services.dart';
import 'package:greenbook/widgets/custom_floating_action_button.dart';
import 'package:greenbook/widgets/custom_image_picker.dart';
import 'package:greenbook/widgets/custom_primary_filled_button.dart';
import 'package:greenbook/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

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

  final UserServices userServices = UserServices();

  void saveChanges() {
    final user = Provider.of<UserProvider>(context, listen:  false).user;  
    userServices.editProfileSettings(
        context: context,
        id: user.id,
        name: nameController.text,
        email: user.email,
        username: user.username,
        password: user.password,
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
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Settings",
          style: GoogleFonts.manrope(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 0,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: Center(
          child: Column(
            children: [
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
                labelText: "Name",
              ),
              SizedBox(
                height: 40,
              ),
              CustomPrimaryFilledButton(
                text: "Save", 
                width: 320, 
                height: 60, 
                textSize: 18, 
                onPressed: (){
                  saveChanges();
                }
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: 
        FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom:20,right: 20),
        child: CustomFloatingActionButton()
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


