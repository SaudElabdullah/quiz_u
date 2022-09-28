import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_u/app/quiz/models/question.dart';

class QuizService {
  static Future<List<Question>> getQuestions(String token) async {
    var headers = {
      'Authorization':
          'Bearer $token'
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

  static Future<bool> postScore(
      String token,
      String score,
      ) async {
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
    request.body = json.encode({"score": score});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return (jsonDecode(await response.stream.bytesToString()) as Map<dynamic, dynamic>)['success'] as bool;
  }
}
