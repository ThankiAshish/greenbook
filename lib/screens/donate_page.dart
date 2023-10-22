// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/widgets/custom_floating_action_button.dart';
import 'package:greenbook/widgets/custom_primary_filled_button.dart';
import 'package:greenbook/widgets/custom_text_field.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class DonatePage extends StatefulWidget {
  const DonatePage({super.key});

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  bool showInvalidAmountMessage = false;
  int currIndex = 0;
  final _razorpay = Razorpay();

  var amountController = TextEditingController();
  TextEditingController gardenerNameController = TextEditingController();
  TextEditingController noteController = TextEditingController();


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


        body: SingleChildScrollView(
          child: Padding(
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
            
                  CustomTextField(
                    controller: gardenerNameController, 
                    keyboardType: TextInputType.text, 
                    labelText: "Garderner Name",
        
                  ),
        
                  SizedBox(
                    height: 20,
                  ),
        
                  CustomTextField(
                    controller: amountController, 
                    keyboardType: TextInputType.number, 
                    labelText: "Amount",
                    hintText: "Amount",
                    inputFormatters: <TextInputFormatter>[
                       FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (value){
                      if (int.tryParse(value) == null) {
                        setState(() {
                          showInvalidAmountMessage = true;
                        });
                      } else {
                        setState(() {
                          showInvalidAmountMessage = false;
                        });
                      }
                    }
                    ),
          
                  SizedBox(
                    height: 20,
                  ),
        
                  CustomTextField(
                    controller: noteController, 
                    keyboardType: TextInputType.text, 
                    labelText: "Note",
                    hintText: "Note",  
                  ),
                
                  SizedBox(
                    height: 20,
                  ),
        
                  CustomPrimaryFilledButton(
                  text: "Donate", 
                  width: 280, 
                  height: 50, 
                  textSize: 18, 
                  onPressed:(){
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
                  } 
                  ),
          
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

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }
}
