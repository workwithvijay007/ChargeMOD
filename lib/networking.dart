import 'dart:convert';
import 'package:http/http.dart' as http;
import 'constants.dart';

// Perfectly working
Future<bool> postSendOTP(String mobileNumber) async {
  // API endpoint and parameters
  String uri = 'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/$organizationId/$projectId/$appVersion/signIn';
  Map<String, dynamic> data = {
    'mobile': mobileNumber,
  };
  String jsonData = jsonEncode(data);
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  // print('Mobile: $mobileNumber and OTP: $otp');
  try {
    // Send POST request
    http.Response response = await http.post(
      Uri.parse(uri),
      headers: headers,
      body: jsonData,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      // Request successful, handle the response here
      print('OTP Sent Successfully');
      return true;

    } else {
      // Request failed
      print('Failed to send OTP. Status code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      return false;
    }
  } catch (e) {
    print('Error sending OTP: $e');
    return false;
  }
}

// Perfectly working
Future<bool> postVerifyOTP(String mobileNumber, String otp) async {
  String uri =
      'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/$organizationId/$projectId/$version/verify';
  Map<String, dynamic> data = {
    "mobile": mobileNumber,
    "otp": otp, // Ensure OTP is a string here
  };
  String jsonData = jsonEncode(data);
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  // print('Mobile: $mobileNumber and OTP: $otp');
  try {
    http.Response response = await http.post(
      Uri.parse(uri),
      headers: headers,
      body: jsonData,
    );
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}'); // Print entire response body
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      int statusCode = responseBody["statusCode"];
      isNewUser = responseBody["data"]["isNewUser"];
      bool otpMatched = responseBody["feasibilityStatus"];
      String accessToken = responseBody["data"]["accessToken"];
      String refreshToken = responseBody["data"]["refreshToken"];
      String userId = responseBody["data"]["userId"];

      // Handle the response data as needed
      return otpMatched;
    } else {
      // Request failed
      print('Wrong OTP. Status code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      return false;
    }
  } catch (e) {
    print('Error sending OTP: $e');
    return false;
  }
}

// Perfectly working
Future<bool> postRegisterUserDetails(String mobileNumber, String firstName, String lastName, String mailID) async {
  String uri =
      'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/$organizationId/$projectId/$version/register';
  Map<String, String> data = <String, String>{
    "mobile": mobileNumber,
    "firstName": firstName,
    "lastName": lastName,
    "email": mailID,
  };
  String jsonData = jsonEncode(data);
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  print('Mobile: $mobileNumber and OTP: $otp');
  try {
    http.Response response = await http.post(
      Uri.parse(uri),
      headers: headers,
      body: jsonData,
    );
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}'); // Print entire response body
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);

      int statusCode = responseBody['statusCode'];
      bool feasibilityStatus = responseBody['feasibilityStatus'];
      String message = responseBody['message'];
      Map<String, dynamic> innerData = responseBody['data'];
      String accessToken = innerData['accessToken'];
      String refreshToken = innerData['refreshToken'];
      bool isNewUser = innerData['isNewUser'];
      String userId = innerData['userId'];

      return true;
    } else {
      // Request failed
      print('Registration failed. Status code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      return false;
    }
  } catch (e) {
    print('Error occurred: $e');
    return false;
  }
}

// Failed
Future<bool> postGetUserDetails() async {
  String uri =
      'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/$organizationId/$projectId/$version/get-customer';
  Map<String, String> data = <String, String>{
  };
  String jsonData = jsonEncode(data);
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  print('Getting/Fetching Mobile: $phoneNumber and OTP: $otp');
  try {
    http.Response response = await http.post(
      Uri.parse(uri),
      headers: headers,
      body: jsonData,
    );
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}'); // Print entire response body
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      int statusCode = data['statusCode'];
      bool feasibilityStatus = data['feasibilityStatus'];
      String message = data['message'];
      Map<String, dynamic> userData = data['data'];

      List<dynamic> users = userData['user'];
      for (var user in users) {
        String userId = user['_id'];
        String mobileNumber = user['mobile'];
        bool isVerified = user['isVerified'];
        String status = user['status'];
        String createdAt = user['createdAt'];
        String updatedAt = user['updatedAt'];
        String email = user['email'];
        String firstName = user['firstName'];
        String lastName = user['lastName'];

        List<String> refreshTokens = List<String>.from(user['refreshToken']);
      }
      return true;
    } else {
      // Request failed
      print('Unable to fetch data. Status code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      return false;
    }
  } catch (e) {
    print('Error occurred: $e');
    return false;
  }
}


Future<void> postResendOTP(String mobileNumber) async {
  String uri =
      'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/$organizationId/$projectId/$version/resend';
  Map<String, dynamic> data = {
    "mobile": mobileNumber,
    "type": "text",
  };
  String jsonData = jsonEncode(data);
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  print('Mobile: $mobileNumber and OTP: $otp');
  try {
    // Send POST request
    http.Response response = await http.post(
      Uri.parse(uri),
      headers: headers,
      body: jsonData,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      // Request successful, handle the response here
      print('Re-sent OTP Successfully. Re-sent');

    } else {
      // Request failed
      print('Failed to send OTP. Status code: ${response.statusCode}');
      print('Response Body: ${response.body}');
    }
  } catch (e) {
    print('Error sending OTP: $e');
  }
}

Future<void> logout (int mobileNumber, int otp) async {
  String uri = 'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/:$organizationId/:$projectId/logout';
  Map<String, dynamic> data = {
    "mobile": mobileNumber,
    "otp": otp,
  };
  String jsonData = jsonEncode(data);
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  try {
    // Send POST request
    http.Response response = await http.post(
      Uri.parse(uri),
      headers: headers,
      body: jsonData,
    );
    if (response.statusCode == 200) {
      // Request successful, handle the response here
      // print('OTP Sent Successfully');
    } else {
      // Request failed
      // print('Wrong OTP. Status code: ${response.statusCode}');
      // print('Response Body: ${response.body}');
    }
  } catch (e) {
    // print('Error sending OTP: $e');
  }


}
