import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_u/app/login/models/user.dart';

class ProfileServices {
  Future<User> getUserInformation(String token) async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNjYzMzU4NDY1fQ.LlVAcArd2Bn3gtdanoHlfMOsHn0gRMqvVHozUk4bjWM'
    };
    var request = http.Request(
      'GET',
      Uri.parse(
        'https://quizu.okoul.com/UserInfo',
      ),
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return (jsonDecode(await response.stream.bytesToString()) as List<dynamic>)
        .map((e) => User.fromMap(e as Map<String, dynamic>))
        .toList()
        .first;
  }
}
