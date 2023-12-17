import 'package:flutter/material.dart';
import 'chargeMOD.dart';
import 'menu_home.dart';
import 'splashscreen.dart';
import 'onboarding_page_1.dart';
import 'onboarding_page_2.dart';
import 'onboarding_page_3.dart';
import 'otp_registration.dart';
import 'otp_verification.dart';
import 'update_profile_screen.dart';
import 'menu_profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChargeMOD',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set your theme here
      ),
      initialRoute: '/', // Set initial route to splash screen
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding_page_1': (context) => OnboardingPage1(),
        '/onboarding_page_2': (context) => OnboardingPage2(),
        '/onboarding_page_3': (context) => OnboardingPage3(),
        '/otp_registration': (context) => const RegisterOTP(),
        '/otp_verification': (context) => const VerifyOTP(),
        '/update_profile_screen': (context) => const UpdateProfile(),
        '/BottomNavIndexedStack': (context) => const BottomNavIndexedStack(),
        },
    );
  }
}
