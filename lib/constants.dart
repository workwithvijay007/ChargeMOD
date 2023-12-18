import 'package:flutter/material.dart';

String organizationId = '64941897fdb322dbf94ad2b8';
String projectId = '6494141957d29409895704d2';
String version = '1.0.0';
String appVersion = '1.0.0';
String countryCode = '+91';
String phoneNumber = '';
String? otp;
String? refreshToken;
bool? newUser;
String? accessToken;
bool isNewUser = false;
Color col = Colors.grey;
String enteredPhoneNumber = '';

bool otpMatched = false;

RichText richText (String sampleText, {FontWeight fontWt = FontWeight.w600, col = const Color(0xFF2E2E2D), double size = 12, String family = 'Poppins'} ) {
  return  RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      children: [
        TextSpan(
          text: sampleText,
          style: TextStyle(
            fontFamily: family,
            fontWeight: fontWt,
            fontSize: size,
            height: 1.5,
            color: col,
          ),
        ),
      ],
    ),
  );
}

Row skipButton(context, page){
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      IconButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, page);
        },
        icon: richText('SKIP', fontWt: FontWeight.w500, size: 16),
      ),
    ],
  );
}

SizedBox topText (String line1, line2, line3){
  return SizedBox(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          richText(line1, fontWt: FontWeight.w500, size: 16),
          richText(line2, fontWt: FontWeight.w700, size: 40),
          richText(line3, fontWt: FontWeight.w700, size: 40, col: const Color(0xFFE6740C)),
        ],
      ),
    ),
  );
}

SizedBox bottomText (String str){
  return SizedBox(
    child: Column(
      children: [
        richText(str, fontWt: FontWeight.w400, size: 15, col: const Color(0xFF000000),),
      ],
    ),
  );
}

SizedBox currentPageIndicator(currentPage) {
  List<bool> indicators = [false, false, false];
  indicators[currentPage - 1] = true;
  return SizedBox(
    width: 60,
    height: 12,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: indicators.map((isCurrent) {
        return SizedBox(
          width: isCurrent ? 12.0 : 8.0,
          height: isCurrent ? 12.0 : 8.0,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCurrent ? const Color(0xFF2E2E2D) : const Color(0xFF666766),
            ),
          ),
        );
      }).toList(),
    ),
  );
}

IconButton sideButton (context, String page, IconData icon){
  return IconButton(
    onPressed: () {
      Navigator.pushReplacementNamed(context, page);
    },
    icon: SizedBox(
      width: 52,
      height: 52,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFE6740C),
        ),
        child: Icon(icon, color: const Color(0xFFFFFFFF),),
      ),
    ),
  );
}

String line = 'This action will reflect in your activities and payments after saving. we ask for email details for receiving monthly activity and notifications.';



TextStyle kTextStyle = const TextStyle(
  fontFamily: 'ABeeZee',
  fontSize: 22,
  fontWeight: FontWeight.w400,
  letterSpacing: 0,
  color: Color(0xFF2E2E2D),
);

TextStyle kOTPTextStyle = const TextStyle(
  fontFamily: 'Airbnb Cereal App',
  fontWeight: FontWeight.w400,
  color: Color(0xFF534B4A),
  fontSize: 24,
);

InputDecoration otpBox = const InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: Color(0xFFE4DFDF)),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: Color(0xFF534B4A)),
  ),
  constraints: BoxConstraints(
    maxWidth: 55,
    maxHeight: 55,
  ),
);
