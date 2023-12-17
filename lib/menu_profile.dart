import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constants.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String selectedIcon = ''; // Add a variable to track the selected icon

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                richText('Hello', fontWt: FontWeight.w500, col: const Color(0xFF666766)),
                richText('Vijay', fontWt: FontWeight.w500, size: 16),
              ],
            ),

            const SizedBox(width: 312, height: 131,),

            const SizedBox(height: 16),

            _buildCard([
              'My Payments',
              'My Electric Vehicles',
              'My Favourite Stations',
              'Alpha Membership'
            ]),

            const SizedBox(height: 16),

            SizedBox(
              width: 312,
              height: 38,
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE6740C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Set the border radius
                  ),
                ),
                child: richText('Buy Machines From chargeMOD', fontWt: FontWeight.w400, col: const Color(0xFFFFFFFF)),
              ),
            ),

            const SizedBox(height: 16),

            _buildCard(['My Devices', 'My Orders']),

            const SizedBox(height: 16),

            _buildCard(['Help', 'Raise Complaint', 'About Us', 'Privacy Policy']),

            const SizedBox(height: 16),

            SizedBox(
              width: 312,
              height: 38,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE6740C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Set the border radius
                  ),
                ),
                child: richText('Logout', fontWt: FontWeight.w400, col: const Color(0xFFFFFFFF)),
              ),
            ),

            const SizedBox(height: 16),

            SvgPicture.asset('images/icon.svg', width: 16, height: 24.48,),

            const SizedBox(height: 16),

            Center(child: richText('V 1.0.0 (001)',fontWt: FontWeight.w400, size: 10, col: const Color(0xFF666766),)),

            const SizedBox(height: 16),

            richText('Copyright © 2022 BPM Power Pvt Ltd.\nAll rights reserved.',fontWt: FontWeight.w400, size: 10, col: const Color(0xFF666766),),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }


  Widget _buildCard(List<String> dropdownItems) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Card(
        elevation: 0, // Set elevation to 0 to remove the default card shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(dropdownItems.length * 2 - 1, (index) {
            if (index.isOdd) {
              return const Divider(
                height: 0.5,
                indent: 16,
                endIndent: 16,
                color: Color(0xFF666766),
              );
            } else {
              final itemIndex = index ~/ 2;
              return ListTile(
                leading: SizedBox(
                  width: 38.9,
                  height: 38.9,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFEBEBEB),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'images/${dropdownItems[itemIndex]}.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dropdownItems[itemIndex],
                      style: const TextStyle(color: Colors.black),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                    ),
                  ],
                ),
                onTap: () {
                  // Handle onTap event for each item if needed
                },
              );
            }
          }),
        ),
      ),
    );
  }

}
