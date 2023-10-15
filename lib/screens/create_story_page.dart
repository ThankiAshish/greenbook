import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/services/auth_services.dart';
import 'package:greenbook/services/story_services.dart';
import 'package:greenbook/widgets/custom_image_picker.dart';
import 'package:greenbook/widgets/custom_primary_filled_button.dart';
import 'package:greenbook/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../utils/utils.dart';

class CreateStory extends StatefulWidget {
  const CreateStory({super.key});

  @override
  State<CreateStory> createState() => _CreateStoryState();
}

class _CreateStoryState extends State<CreateStory> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  late dynamic user;
  var picker = ImagePicker();
  late dynamic pickedFile;
  late dynamic imagePath;

  final StoryService storyService = StoryService();

  void createStory() {
    storyService.createStory(
        context: context,
        id: user,
        title: titleController.text,
        body: bodyController.text,
        photo: imagePath,
        likes: 0
    );
  }

  @override
  void initState() {
    imagePath = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Create Story',
          style: GoogleFonts.manrope(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 0,
            letterSpacing: 2,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImagePicker(
                height: 200,
                width: 350,
                boxShape: BoxShape.rectangle,
                imagePath: imagePath,
                onTap: imagePickerOnClick),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
                controller: titleController,
                keyboardType: TextInputType.text,
                labelText: "Title"),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: bodyController,
              keyboardType: TextInputType.multiline,
              labelText: "Body",
              maxLines: 8,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomPrimaryFilledButton(
                text: "Create Story",
                width: 350,
                height: 50,
                textSize: 20,
                onPressed: createStoryButtonOnClick)
          ],
        ),
      ),
    );
  }

  void createStoryButtonOnClick() {
    if (imagePath == "" ||
        titleController.text.isEmpty ||
        bodyController.text.isEmpty) {
      showSnackBar(context, 'All Fields are Required!');
    }
  }

  void imagePickerOnClick() async {
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      imagePath = imageFile.path;
      setState(() {});
    } else {
      createStory();
    }
  }
}
