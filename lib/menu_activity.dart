import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            richText('Your Activity,', size: 40),
            const SizedBox(width: 20, height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                richText('Coming soon...', size: 20),
                const SizedBox(width: 20, height: 20),
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  strokeWidth: 4,
                ),
              ],
            ),
            const SizedBox(width: 20, height: 20),
            richText('#WIP #Work in Progress...', size: 20),
          ],
        ),
      ),
    );
  }

  Widget richText(String text, {double size = 16}) {
    return Text(
      text,
      style: TextStyle(fontSize: size),
    );
  }
}
