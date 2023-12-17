import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'menu_activity.dart';
import 'menu_community.dart';
import 'menu_home.dart';
import 'menu_profile.dart';

class BottomNavIndexedStack extends StatefulWidget {
  const BottomNavIndexedStack({Key? key}) : super(key: key);

  @override
  _BottomNavIndexedStackState createState() => _BottomNavIndexedStackState();
}

class _BottomNavIndexedStackState extends State<BottomNavIndexedStack> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    Home(),
    Activity(),
    Community(),
    Profile(),
  ];

  BottomNavigationBarItem folder(double width, double height, String img, String labelName, bool current) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        width: width,
        height: height,
        child: SvgPicture.asset(
          'images/$img',
          colorFilter: ColorFilter.mode(
            current ? const Color(0xFFE6740C): const Color(0xFF666766),
            BlendMode.srcIn,),
        ),
      ),
      label: labelName,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChargeMOD'),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFFE6740C),
        unselectedItemColor: const Color(0xFF666766),
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          folder(24, 24, 'Home.svg', 'Home', _currentIndex == 0),
          folder(24, 24, 'Activity.svg', 'Activity', _currentIndex == 1),
          folder(24, 24, 'Community.svg', 'Community', _currentIndex == 2),
          folder(24, 24, 'Profile.svg', 'Profile', _currentIndex == 3),
        ],
      ),
    );
  }
}
