import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constants.dart';

class OnboardingPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            Navigator.pushReplacementNamed(context, '/onboarding_page_1');
          } else if (details.primaryVelocity! < 0) {
            Navigator.pushReplacementNamed(context, '/onboarding_page_3');
          }
        },
        child: Stack(
          fit: StackFit.expand,
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
                topText('Easy EV Navigation', 'Travel Route', 'For Electrics'),
                SvgPicture.asset('images/map.svg'),
                bottomText('Grab The Best In Class\nDigital Experience Crafted For\nEV Drivers'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    sideButton(context, '/onboarding_page_1', Icons.arrow_back_ios_new),
                    currentPageIndicator(2),
                    sideButton(context, '/onboarding_page_3', Icons.arrow_forward_ios),
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
