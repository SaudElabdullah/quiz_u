import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_u/app/home/models/question.dart';

class QuestionServices {
  static Future<List<Question>> getQuestions(String token) async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNjYzMzU4NDY1fQ.LlVAcArd2Bn3gtdanoHlfMOsHn0gRMqvVHozUk4bjWM'
    };
    var request = http.Request(
      'GET',
      Uri.parse(
        'https://quizu.okoul.com/Questions',
      ),
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return (jsonDecode(await response.stream.bytesToString()) as List<dynamic>)
        .map((e) => Question.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}
