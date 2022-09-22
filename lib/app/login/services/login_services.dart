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

  static Future<dynamic> registerName(String name) async {
    var request = await http.post(
      Uri.parse(
        'https://quizu.okoul.com/Name',
      ),
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NjM3OTQyNzd9.ft-Mo0BF2gdiaiD7jOPVqAlVx5z_D7Chy_5cl1u77UE',
      },
      body: {'name': 'Saud'},
    );
    return await convert.json.decode(request.body);
  }

  static Future<bool> tokenVerification(String name, String token) async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NjM3OTQ3NDR9.TuIgP-ORS-LBH9OFc3QQ1HFq8cz2OVRSqw9HbXlXVSY',
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
        "name": "Ahmed",
      },
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return (jsonDecode(await response.stream.bytesToString()) as Map<String, dynamic>)['succes'] as bool;
  }
}
