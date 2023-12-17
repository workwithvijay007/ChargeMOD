import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboarding_page_1');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(child: SizedBox(height: 15)),
              SizedBox(
                height: 237.9,
                width: 242.05,
                child: SvgPicture.asset('images/Logo.svg'),
              ),
              const Column(
                children: [
                  SizedBox(
                    height: 6,
                    width: 226,
                    child: LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFe28b2d)),
                      backgroundColor: Color(0xFFebebeb),
                    ),
                  ),
                  Text(
                    'Connecting to chargeMOD',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF666766),
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
