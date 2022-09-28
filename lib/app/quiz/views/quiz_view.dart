import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_u/app/quiz/components/question_component.dart';
import 'package:quiz_u/app/quiz/controllers/quiz_controller.dart';
import 'package:quiz_u/app/quiz/models/question.dart';
import 'package:quiz_u/core/animations/bounce.dart';

class QuizView extends ConsumerStatefulWidget {

  const QuizView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends ConsumerState<QuizView> {

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(quizViewProvider(context));
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
                top: 250,
                right: 20,
                left: 20,
                bottom: 0,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller.when(
                    data: (controller) => controller.pageController,
                    error: (_, __) => PageController(),
                    loading: () => PageController(),
                  ),
                  children: List.generate(
                    controller.when(
                      data: (controller) {
                        controller.startTimer();
                        return controller.questions.length;
                      },
                      error: (_, __) => 0,
                      loading: () => 0,
                    ),
                        (index) =>
                        QuestionComponent(
                          question: controller.when(
                            data: (controller) => controller.questions[index],
                            error: (_, __) => Question(question: '', options: {}, answer: '',),
                            loading: () => Question(question: '', options: {}, answer: '',),
                          ),
                          function: controller.value!.questionControl,
                        ),
                  ),
                ),
            ),
            Positioned(
              bottom: 100,
              right: 80,
              left: 80,
              child: Bounce(
                function: () {
                  controller.value!.navigateToNextPage();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 30,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  child: Text(
                    'Skip',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
