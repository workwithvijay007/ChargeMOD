import 'package:flutter/material.dart';

import 'constants.dart';
import 'networking.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});
  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    caseSensitive: false,
    multiLine: false,
  );
  String? _firstName;
  String? _lastName;
  String? _email;

  InputDecoration _inputDecoration (String hintText){
    return  InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: 1.5,
        color: Color(0xFF666766),
      ),
      alignLabelWithHint: true,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Color(0xFFE4DFDF),), // Set border side color here
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.black), // Set focused border side color here
      ),
      constraints: const BoxConstraints(
        maxWidth: 305,
        maxHeight: 41,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      
            richText( 'Update Profile', fontWt: FontWeight.w400, size: 16),
      
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
      
                children: [
                  richText('First Name'),
                  TextFormField(
                    decoration: _inputDecoration('First name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _firstName = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  richText('Last Name'),
                  TextFormField(
                    decoration: _inputDecoration('Last name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _lastName = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  richText('E-mail'),
                  TextFormField(
                    decoration: _inputDecoration('email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  richText('Phone Number'),
                  richText(enteredPhoneNumber, fontWt: FontWeight.w400),
                ],
      
              ),
            ),
      
            Column(
              children: [
                richText('Completing Your Profile', fontWt: FontWeight.w400),
                SizedBox(
                  width: 306,
                  height: 29,
                  child: richText(line, fontWt: FontWeight.w400, size: 8),
                ),
                SizedBox(
                  width: 312,
                  height: 38,
                  child: ElevatedButton(
                    onPressed: () {
                      if (isNewUser) {
                        // New Registration
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          postRegisterUserDetails(phoneNumber, _firstName!, _lastName!, _email!);
                        }
                      } else{
                        // Existing User
                        postGetUserDetails();// pass Token
                      }
                      Navigator.pushNamed(context, '/BottomNavIndexedStack');
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE6740C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Set the border radius
                      ),
                    ),
                    child: richText('Save Changes', fontWt: FontWeight.w400, col: const Color(0xFFFFFFFF)),
                  ),
                ),
              ],
            ),
      
          ],
        ),
      ),
    );
  }
}

