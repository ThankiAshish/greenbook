import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/screens/change_password_page.dart';
import 'package:greenbook/widgets/custom_floating_action_button.dart';
import 'package:greenbook/widgets/custom_primary_filled_button.dart';
import 'package:greenbook/widgets/custom_text_field.dart';

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({super.key});

  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  bool showInvalidAmountMessage = false;
  int currIndex = 0;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account settings",
          style: GoogleFonts.manrope(
              textStyle: GoogleFonts.manrope(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 0,
              letterSpacing: 2,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Center(
            child: Column(
              children: [
                CustomTextField(
                  controller: usernameController, 
                  keyboardType: TextInputType.text, 
                  labelText: "Username"
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: emailController, 
                  keyboardType: TextInputType.emailAddress, 
                  labelText: "Email"
                ),
                const SizedBox(
                  height: 28,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                         Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => const ChangePassword()));
                      },
                      child: Text(
                        'Change Password',
                        style: GoogleFonts.manrope(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.80,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        
                      },
                      child: Text(
                        'Delete Account',
                        style: GoogleFonts.manrope(
                          color: const Color(0xFF660000),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.80,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomPrimaryFilledButton(
                  text: "Save", 
                  width: 280, 
                  height: 50, 
                  textSize: 18, 
                  onPressed: (){}
                )
              ],
            ),
          ),
        ),
      ),

    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    floatingActionButton: const CustomFloatingActionButton()
    );
  }
}
