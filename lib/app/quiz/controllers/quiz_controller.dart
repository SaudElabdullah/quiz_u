import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_u/app/login/models/user.dart';
import 'package:quiz_u/app/quiz/models/question.dart';
import 'package:quiz_u/app/quiz/services/quiz_service.dart';
import 'package:quiz_u/app/quiz/views/loose_view.dart';
import 'package:quiz_u/app/quiz/views/win_view.dart';
import 'package:quiz_u/core/database/isar_db.dart';

final quizViewProvider = FutureProvider.family<QuizController, BuildContext>((ref, context) async {
  User user = await IsarDB.getUser();
  List<Question> questions = await QuizService.getQuestions(user.token);

  return QuizController(
    context: context,
    questions: questions,
    user: user,
    ref: ref,
  );
});

class QuizController {
  late PageController pageController;
  late Timer timer;
  late int start;
  late int score;
  late State timeState;
  List<Question> questions;
  BuildContext context;
  User user;
  final FutureProviderRef<QuizController> ref;

  QuizController({required this.context, required this.questions, required this.user, required this.ref}) {
    pageController = PageController(
      keepPage: true,
      initialPage: 0,
    );
    start = 120;
    score = 0;
  }

  String formatHHMMSS() {
    final hours = (start / 3600).truncate();
    start = (start % 3600).truncate();
    final minutes = (start / 60).truncate();

    final hoursStr = (hours).toString().padLeft(2, '0');
    final minutesStr = (minutes).toString().padLeft(2, '0');
    final secondsStr = (start % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return '$minutesStr:$secondsStr';
    }

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  void startTimer() {
    const oneSec = const Duration(
      seconds: 1,
    );
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
          if (score != 0) {
            QuizService.postScore(
              user.token,
              score.toString(),
            );
            IsarDB.updateUserScore(score.toString());
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WinView(
                  score: score.toString(),
                ),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LooseView(),
              ),
            );
          }
        } else {
          start--;
          // ref.refresh(quizViewProvider(context));
        }
      },
    );
  }

  void navigateToNextPage() {
    pageController.nextPage(
      duration: const Duration(
        milliseconds: 200,
      ),
      curve: Curves.ease,
    );
  }

  questionControl(bool isAnswer, int index) {
    if (isAnswer) {
      score++;
      navigateToNextPage();
      if (questions.length == index) {
        QuizService.postScore(
          user.token,
          score.toString(),
        );
        IsarDB.updateUserScore(score.toString());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WinView(
              score: score.toString(),
            ),
          ),
        );
      }
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LooseView(),
        ),
      );
    }
  }
}
