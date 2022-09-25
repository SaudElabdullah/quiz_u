import 'dart:convert' as convert;
import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginServices {
  static Future<dynamic> login(String otp, String phoneNumber) async {
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

  static Future<dynamic> registerName(String name, String token,) async {
    var request = await http.post(
      Uri.parse(
        'https://quizu.okoul.com/Name',
      ),
      headers: {
        'Authorization':
            'Bearer $token',
      },
      body: {'name': name},
    );
    return await convert.json.decode(request.body);
  }

  static Future<bool> tokenVerification(String name, String token) async {
    var headers = {
      'Authorization':
          'Bearer $token',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
      'GET',
      Uri.parse(
        'https://quizu.okoul.com/Token',
      ),
    );
    request.body = json.encode(
      {
        "name": name,
      },
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return (jsonDecode(await response.stream.bytesToString()) as Map<String, dynamic>)['succes'] as bool;
  }

  Future<void> postUserScore(String token, String score) async {
    var headers = {
      'Authorization':
          'Bearer $token',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
      'POST',
      Uri.parse(
        'https://quizu.okoul.com/Score',
      ),
    );
    request.body = json.encode({"score": "11"});
    request.headers.addAll(headers);

    await request.send();
  }
}
