import 'package:flutter/material.dart';
import 'package:quiz_u/app/home/views/home_view.dart';
import 'package:quiz_u/app/quiz/views/quiz_view.dart';
import 'package:quiz_u/core/animations/bounce.dart';

class LooseView extends StatefulWidget {
  const LooseView({
    Key? key,
  }) : super(key: key);

  @override
  _LooseViewState createState() => _LooseViewState();
}

class _LooseViewState extends State<LooseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 100,
              child: Icon(
                Icons.sentiment_very_dissatisfied,
                size: 200,
                color: Colors.red,
              ),
            ),
            Positioned(
              bottom: 250,
              child: Bounce(
                function: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizView(
                      ),
                    ),
                    (Route<dynamic> route) => false,
                  );
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
                    'Try Again',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 30,
              child: Bounce(
                function: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeView(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Icon(
                  Icons.cancel,
                  size: 40,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
