import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constants.dart';

class OnboardingPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            Navigator.pushReplacementNamed(context, '/onboarding_page_2');
          } else if (details.primaryVelocity! < 0) {
            Navigator.pushReplacementNamed(context, '/otp_registration');
          }
        },
        child: Stack(
          children: [
            SvgPicture.asset(
              'images/Background.svg',
              fit: BoxFit.cover,
              color: const Color(0xFF2E2E2D),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                skipButton(context, '/otp_registration'),
                topText('Interaction with Grid', 'RealTime', 'Monitoring'),
                SvgPicture.asset('images/map.svg'),
                bottomText('Intelligent Sensible Devices\nAmbicharge Series'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    sideButton(context, '/onboarding_page_2', Icons.arrow_back_ios_new),
                    currentPageIndicator(3),
                    sideButton(context, '/otp_registration', Icons.arrow_forward_ios),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
