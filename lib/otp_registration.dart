import 'dart:async';

import 'package:chargemod/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'networking.dart';


class RegisterOTP extends StatefulWidget {
  const RegisterOTP({super.key});
  @override
  State<RegisterOTP> createState() => _RegisterOTPState();
}

Color colorCode(String s) {
  return s.toString().length == 10 ? const Color(0xFFE6740C) : Colors.grey;
}

class _RegisterOTPState extends State<RegisterOTP> {
  final TextEditingController mobileNumber = TextEditingController();
  String enteredPhoneNumber = '';

  bool _showText = false;
  void showText() {
    setState(() {
      _showText = true;
    });

    // Timer to hide the text after 3 seconds
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _showText = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Column(
              children: [
                const Column(
                  children: [
                    Text(
                      'ChargeMOD',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        height: 1.5,
                        color: Color(0xFF2E2E2D),
                      ),
                    ),
                    Text(
                      'Let\'s Start',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                        height: 1.25,
                        color: Color(0xFF2E2E2D),
                      ),
                    ),
                    Text(
                      'From Login',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                        height: 1.25,
                        color: Color(0xFFE6740C),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 38,
                  width: 289,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 36,
                        width: 63,
                        child: CountryCodePicker(
                          initialSelection: 'IN',
                          favorite: ['+91', 'IN'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: true,
                          hideMainText: true,
                          showDropDownButton: true,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: mobileNumber,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                          ),
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter phone number',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: 'ABeeZee',
                              color: Color(0xFF534B4A),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Color(0xFFE4DFDF)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            prefixIcon: Icon(
                              Icons.phone_outlined,
                              color: Color(0xFFE6740C),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          ),
                          onChanged: (value) {
                            setState(() {
                              enteredPhoneNumber = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    if (enteredPhoneNumber.length == 10) {
                      if (await postSendOTP(enteredPhoneNumber)){
                        phoneNumber = enteredPhoneNumber;
                        Navigator.pushNamed(context, '/otp_verification');
                      } else {
                        // if (_showText) {
                        //   richText('Invalid Number', col: const Color(0xFFE6740C));
                        // }
                      }
                    } else {
                      // print('Invalid phone number');
                    }
                  },
                  child: Container(
                    height: 38,
                    width: 289,
                    decoration: BoxDecoration(
                      color: colorCode(enteredPhoneNumber),
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                    ),
                    child: const Center(
                      child: Text(
                        'Sent OTP',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
            width: 244,
          ),
          SizedBox(
            width: 244,
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                richText('By continuing, you agree to our', family: 'ABeeZee', fontWt: FontWeight.w400),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: const TextStyle(
                          color: Color(0xFFE6740C),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                          await launchUrl(Uri.parse('https://chargemod.com/terms-and-conditions'));
                          },
                      ),
                      const TextSpan(
                        text: ' and ',
                        style: TextStyle(
                          fontFamily: 'ABeeZee',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 1.75,
                          color: Color(0xFF2E2E2D),
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: const TextStyle(
                          color: Color(0xFFE6740C),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await launchUrl(Uri.parse('https://chargemod.com/privacy'));
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void launchLink(String url) async {
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
