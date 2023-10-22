// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AccountSettingsPage extends StatefulWidget {
//   const AccountSettingsPage({super.key});

//   @override
//   State<AccountSettingsPage> createState() => _AccountSettingsPageState();
// }

// class _AccountSettingsPageState extends State<AccountSettingsPage> {
//   bool showInvalidAmountMessage = false;
//   int currIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment(0.3420201, -1.3),
//           end: Alignment(-0.11, 10.0),
//           colors: [Colors.white, Color(0x66D3FF76)],
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           title: Text(
//             "Account settings",
//             style: GoogleFonts.manrope(
//               textStyle: GoogleFonts.manrope(color: Colors.black),
//             ),
//           ),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back, color: Colors.black),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//           centerTitle: true,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(40),
//           child: Center(
//             child: Column(
//               children: [
//                 Text(
//                   'Change Details',
//                   style: GoogleFonts.manrope(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.w400,
//                     height: 0,
//                     letterSpacing: 2.30,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 35,
//                 ),
//                 SizedBox(
//                   width: 600, // Adjust the width as per your preference
//                   child: TextField(
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white.withOpacity(0.8),
//                       hintText: 'Username',
//                       hintStyle: GoogleFonts.manrope(
//                         textStyle: GoogleFonts.manrope(color: Colors.black),
//                       ),
//                       contentPadding: EdgeInsets.all(20),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                   width: 600, // Adjust the width as per your preference
//                   child: TextField(
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white.withOpacity(0.8),
//                       hintText: 'Email',
//                       hintStyle: GoogleFonts.manrope(
//                         textStyle: GoogleFonts.manrope(color: Colors.black),
//                       ),
//                       contentPadding: EdgeInsets.all(20),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                     keyboardType: TextInputType.number,
//                     inputFormatters: <TextInputFormatter>[
//                       FilteringTextInputFormatter.digitsOnly,
//                     ],
//                     onChanged: (value) {
//                       if (int.tryParse(value) == null) {
//                         setState(() {
//                           showInvalidAmountMessage = true;
//                         });
//                       } else {
//                         setState(() {
//                           showInvalidAmountMessage = false;
//                         });
//                       }
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 28,
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Change Password',
//                     style: GoogleFonts.manrope(
//                       color: Color(0xFF660000),
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400,
//                       height: 0,
//                       letterSpacing: 0.80,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Deactivate Account',
//                     style: GoogleFonts.manrope(
//                       color: Color(0xFF660000),
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400,
//                       height: 0,
//                       letterSpacing: 0.80,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Delete Account',
//                     style: GoogleFonts.manrope(
//                       color: Color(0xFF660000),
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400,
//                       height: 0,
//                       letterSpacing: 0.80,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.bottomCenter,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Add your button click action here
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFF000066),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 110, vertical: 17),
//                       ),
//                       child: Text(
//                         'Proceed',
//                         style: GoogleFonts.manrope(
//                           textStyle: GoogleFonts.manrope(
//                             color: Colors.white,
//                             fontSize: 20,
//                             letterSpacing: 2.25,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           currentIndex: currIndex,
//           onTap: (int index) {
//             setState(() {
//               currIndex = index;
//             });
//           },
//           selectedItemColor: Colors.blue,
//           unselectedItemColor: Colors.black,
//           iconSize: 35.0,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.add_circle),
//               label: 'Add',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.menu),
//               label: 'Menu',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            "Account settings",
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
                    height: 35,
                  ),
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: 600, // Adjust the width as per your preference
                    child: CustomTextField(
                      controller: usernameController, 
                      keyboardType: TextInputType.text, 
                      labelText: "Username")
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 600, // Adjust the width as per your preference
                    child: CustomTextField(
                    controller: emailController, 
                    keyboardType: TextInputType.emailAddress, 
                    labelText: "Email"
                    )
                  ),

                  SizedBox(
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
                          style: TextStyle(
                            color: Color(0xFF660000),
                            fontSize: 16,
                            
                            fontFamily: 'Manrope',
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
                          'Deactivate Account',
                          style: TextStyle(
                            color: Color(0xFF660000),
                            fontSize: 16,
                            fontFamily: 'Manrope',
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
                          style: TextStyle(
                            color: Color(0xFF660000),
                            fontSize: 16,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.80,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  
                 CustomPrimaryFilledButton(
                 text: "Save", 
                 width: 280, 
                 height: 50, 
                 textSize: 18, 
                 onPressed: (){})
                ],
              ),
            ),
          ),
        ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: CustomFloatingActionButton()
      ),
    );
  }
}
