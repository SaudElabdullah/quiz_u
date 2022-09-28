import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:quiz_u/app/quiz/models/question.dart';
import 'package:quiz_u/core/animations/bounce.dart';

class QuestionComponent extends StatefulWidget {
  final Question question;
  final Function function;

  const QuestionComponent({
    Key? key,
    required this.question,
    required this.function,
  }) : super(key: key);

  @override
  _QuestionComponentState createState() => _QuestionComponentState();
}

class _QuestionComponentState extends State<QuestionComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.question.question,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 30,
            color: Color(0xFF3c3c3b),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 40,
        ),
        Expanded(
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 3,
            children: List.generate(
              widget.question.options.length,
              (index) => Bounce(
                function: () {
                  widget.function(
                    widget.question.isAnswerCorrect(
                      widget.question.options.keys.toList()[index],
                    ),
                    index,
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    border: Border.all(
                      width: 0.5,
                      color: Colors.blueGrey,
                    ),
                  ),
                  child: Text(
                    widget.question.options.values.toList()[index],
                    style: TextStyle(
                      color: Color(0xFF3c3c3b),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ).animate().fadeIn().slide(),
      ],
    );
  }
}
