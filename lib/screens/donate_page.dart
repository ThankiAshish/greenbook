// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/screens/gardeners_page.dart';
import 'package:greenbook/screens/home_page.dart';
import 'package:greenbook/screens/leaderboard_page.dart';
import 'package:greenbook/screens/profile_page.dart';
import 'package:greenbook/screens/settings_page.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class DonatePage extends StatefulWidget {
  const DonatePage({super.key});

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  bool showInvalidAmountMessage = false;
  int currIndex = 0;
  var _razorpay = Razorpay();

  var amountController = TextEditingController();

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
  // Do something when payment succeeds
  print("Payment Done");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
  // Do something when payment fails
   print("Payment failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
  // Do something when an external wallet is selected
  }

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
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
            "Donate",
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


        body: Padding(
          padding: const EdgeInsets.all(45),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Donation Details',
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
                TextField(
                    decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                  hintText: 'Gardener Name',
                  hintStyle: GoogleFonts.manrope(
                    textStyle: TextStyle(color: Colors.black),
                  ),
                  contentPadding: EdgeInsets.all(20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                )),

                SizedBox(
                  height: 20,
                ),
                
                TextField(
                  controller: amountController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    hintText: 'Amount',
                    hintStyle: GoogleFonts.manrope(
                      textStyle: TextStyle(color: Colors.black),
                    ),
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    if (int.tryParse(value) == null) {
                      setState(() {
                        showInvalidAmountMessage = true;
                      });
                    } else {
                      setState(() {
                        showInvalidAmountMessage = false;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                  hintText: 'Note',
                  hintStyle: GoogleFonts.manrope(
                    textStyle: TextStyle(color: Colors.black),
                  ),

                  contentPadding: EdgeInsets.all(20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                )),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your button click action here
                      var options = {
                      'key': 'rzp_test_BXJkto30f8wpOR',
                      'amount': (int.parse(amountController.text)*100).toString(), //in the smallest currency sub-unit.
                      'name': 'Jay Kiranbhai Joshi',
                      'description': 'Demo',
                      'timeout': 300, // in seconds
                      'prefill': {
                        'contact': '8787878787',
                        'email': 'hehe.vro@example.com'
                      }
                    };
                      _razorpay.open(options);
                    },


                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(0xFF000066), // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 105, vertical: 17), // Button padding
                    ),
                    child: Text(
                      'Proceed',
                      style: GoogleFonts.manrope(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 2.25,
                        ), // Text color // Text font size
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   currentIndex: currIndex,
        //   onTap: (int index) {
        //     setState(() {
        //       currIndex = index;
        //     });
        //   },
        //   selectedItemColor: Colors.blue,
        //   unselectedItemColor: Colors.black,
        //   iconSize: 35.0,
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.add_circle),
        //       label: 'Add',
        //     ),

        //    BottomNavigationBarItem(
        //       icon: Icon(Icons.menu),
        //       label: 'Menu',
        //     ),
        //   ],
        // ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom:20,right: 20),
        child: FloatingActionButton(
          child: Icon(Icons.menu),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 20,
                        top: 20,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.close),
                        ),
                      ),
                      Positioned(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        top: 40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                 Navigator.of(context).push(
                                 MaterialPageRoute(builder: (ctx) => const HomePage()));
                              },
                              child: Text(
                                "Home",
                                style: GoogleFonts.manrope(
                                  textStyle: TextStyle(
                                    color: Color(0xFF20411B),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 2,
                                    height: 0,
                                    ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                 Navigator.of(context).push(
                                 MaterialPageRoute(builder: (ctx) => const ProfilePage()));
                              },
                              child: Text(
                                "Profile",
                                style: GoogleFonts.manrope(
                                  textStyle: TextStyle(
                                    color: Color(0xFF20411B),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 2,
                                    height: 0,
                                    ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                 Navigator.of(context).push(
                                 MaterialPageRoute(builder: (ctx) => const GardenersPage()));
                              },
                              child: Text(
                                "Garderners",
                                style: GoogleFonts.manrope(
                                  textStyle: TextStyle(
                                    color: Color(0xFF20411B),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 2,
                                    height: 0,
                                    ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                 Navigator.of(context).push(
                                 MaterialPageRoute(builder: (ctx) => const LeaderboardPage()));
                              },
                              child: Text(
                                "Donaters Leaderboard",
                                 style: GoogleFonts.manrope(
                                  textStyle: TextStyle(
                                    color: Color(0xFF20411B),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 2,
                                    height: 0,
                                    ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                 Navigator.of(context).push(
                                 MaterialPageRoute(builder: (ctx) => const LeaderboardPage()));
                              },
                              child: Text(
                                "Gardeners Leaderboard",
                                style: GoogleFonts.manrope(
                                  textStyle: TextStyle(
                                    color: Color(0xFF20411B),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 2,
                                    height: 0,
                                    ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                 MaterialPageRoute(builder: (ctx) => const SettingsPage()));
                              },
                              child: Text(
                                "Settings",
                                style: GoogleFonts.manrope(
                                  textStyle: TextStyle(
                                    color: Color(0xFF20411B),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 2,
                                    height: 0,
                                    ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }
}
