import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constants.dart';

class OnboardingPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            // Swiped right, navigate to previous page or do nothing
          } else if (details.primaryVelocity! < 0) {
            Navigator.pushReplacementNamed(context, '/onboarding_page_2');
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
                topText('Charge your EV', 'At Your', 'Fingertips'),
                SvgPicture.asset('images/bike.svg'),
                bottomText('Scan Charge and Go\nEffortless Charging schemas'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 52, height: 52,),
                    currentPageIndicator(1),
                    sideButton(context, '/onboarding_page_2', Icons.arrow_forward_ios),
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
