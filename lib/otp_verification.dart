import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'networking.dart';
import 'constants.dart';


class VerifyOTP extends StatefulWidget {
  const VerifyOTP({super.key});
  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {

  bool _showText = false;
  void showText() {
    setState(() {
      _showText = true;
    });
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _showText = false;
      });
    });
  }

  List<TextEditingController> controllers = List.generate(4, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  late Timer _timer;
  bool showResendButton = true;
  int seconds = 30;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        setState(() {
          showResendButton = true;
        });
        _timer.cancel();
      }
    });
  }

  void resendOTP() {
    setState(() {
      showResendButton = false;
      seconds = 30;
    });
    startTimer();
    // Logic to resend OTP goes here
  }

  @override
  void dispose() {
    _timer.cancel();
    for (var i = 0; i < controllers.length; i++) {
      controllers[i].dispose();
      focusNodes[i].dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < controllers.length; i++) {
      controllers[i].addListener(() {
        if (controllers[i].text.isEmpty) {
          if (i > 0) {
            FocusScope.of(context).requestFocus(focusNodes[i - 1]);
          }
        }
        if (controllers[i].text.length == 1) {
          if (i < controllers.length - 1) {
            FocusScope.of(context).requestFocus(focusNodes[i + 1]);
          } else {
            FocusScope.of(context).unfocus();
          }
        }
        setState(() {
          otp = controllers.map((controller) => controller.text).join();
        });
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
      
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 375,
                  height: 75,
                ),
      
                // # Verification
                richText('Verification', fontWt: FontWeight.w400, size: 16, col: const Color(0xFF2E2E2D)),
      
                // # We've send you the notification'
                richText('We\'ve send you the notification', family: 'ABeeZee', fontWt: FontWeight.w400, size: 15, col:  const Color(0xFF2E2E2D)),
      
                // # code on +91 Phone Number
                richText('code on $countryCode $phoneNumber', family: 'ABeeZee', fontWt: FontWeight.w400, size: 15),
      
                const SizedBox(height: 10,),
      
                SizedBox(
                  width: 242,
                  height: 56,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      4,
                          (index) => SizedBox(
                        width: 55,
                        height: 55,
                        child: TextField(
                          style: const TextStyle(
                            fontFamily: 'Airbnb Cereal App',
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF534B4A),
                            fontSize: 24,
                          ),
                          controller: controllers[index],
                          focusNode: focusNodes[index],
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                          decoration: const InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Color(0xFFE4DFDF)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Color(0xFF534B4A)),
                            ),
                          ),
                          onChanged: (value) {
                            col = otp!.length == 4 ? const Color(0xFFE6740C) : Colors.grey;
                            print('This is your OTP: $otp');
                            if (value.isEmpty) {
                              if (index > 0) {
                                FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                              }
                            } else if (value.isNotEmpty) {
                              if (index < controllers.length - 1) {
                                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                              } else {
                                FocusScope.of(context).unfocus();
                              }
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
      
                // # Re-sends OTP
                TextButton(
                  onPressed: (){
                  },
                  child: SizedBox(
                    height: 50,
                    width: 162,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        if (showResendButton)
                          TextButton(
                            onPressed: (){
                              resendOTP();
                              postResendOTP(phoneNumber);
                            },
                            // check in constants.dart
                            child: richText('Resent OTP', fontWt: FontWeight.w400, size: 15, col: const Color(0xFFE6740C)),
                          )
                        else
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                height: 1.5,
                                color: Color(0xFF2E2E2D),
                              ),
                              children: [
                                const TextSpan(text: 'Re-send code in '),
                                TextSpan(
                                  text: '00:${seconds.toString().padLeft(2, '0')}',
                                  style: const TextStyle(color: Color(0xFFE6740C)),
                                ),
                              ],
                            ),
                          ),
      
                      ],
                    ),
                  ),
                ),

              ],
            ),

            Column(
              children: [
                if (_showText)
                  AnimatedOpacity(
                    duration: const Duration(seconds: 3),
                    opacity: _showText ? 1.0 : 0.0,
                    child: richText('Incorrect OTP', fontWt: FontWeight.w400, size: 15, col: Colors.red,),
                  ),
              ],
            ),



            // # Continue button to verify OTP Calls VerifyOTP
            Column(
              children: [

                SizedBox(
                  width: 273,
                  height: 43,
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                      });
                      if (otp!.length == 4) {
                        if (await postVerifyOTP(phoneNumber, otp!)){
                          Navigator.pushNamed(context, '/update_profile_screen');
                        } else {
                          showText();
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: col,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Set the border radius
                      ),
                    ),
                    child: richText('CONTINUE', fontWt: FontWeight.w400, size: 15, col:  Colors.white),
                  ),
                ),
      
                const SizedBox(
                  width: 375,
                  height: 75,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


