import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class LoginServices {
  static Future<dynamic> login(String otp, String phoneNumber) async {
    var map = {};
    map['OTP'] = otp;
    map['mobile'] = phoneNumber;
    var request = await http.post(
      Uri.parse(
        'https://quizu.okoul.com/Login',
      ),
      body: {
        'OTP': otp,
        'mobile': phoneNumber,
      },
    );
    return await convert.json.decode(request.body);
  }
}
