import 'package:flutter/material.dart';
import 'constants.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            richText('Welcome, Community', size: 40),
            const SizedBox(width: 20, height: 20,),
            richText('Thank you #ChargeMOD 💙 \nfor providing your API.',size: 20),
            const SizedBox(width: 20, height: 20,),
            richText('Care & Crafted by,\nVijay Saraswatula', size: 24),
            const SizedBox(width: 20, height: 20,),
            richText('WorkWithVijay007@gmail.com\n(made in 💙 with # flutter)', size: 18)
          ],
        ),
      ),
    );
  }
}
