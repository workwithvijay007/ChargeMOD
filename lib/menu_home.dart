import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'images/Background.svg',
          fit: BoxFit.cover,
          color: const Color(0xFF2E2E2D),
        ),
        // child: SvgPicture.asset(
        //   'images/Background.svg',
        //   // width: MediaQuery.of(context).size.width,
        //   // height: MediaQuery.of(context).size.height,
        // ),
      ),
    );
  }
}
