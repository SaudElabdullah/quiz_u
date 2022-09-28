import 'package:flutter/material.dart';
import 'package:quiz_u/app/home/views/home_view.dart';
import 'package:quiz_u/core/animations/bounce.dart';
import 'package:share_plus/share_plus.dart';

class WinView extends StatefulWidget {
  final String score;

  const WinView({
    Key? key,
    required this.score,
  }) : super(key: key);

  @override
  _WinViewState createState() => _WinViewState();
}

class _WinViewState extends State<WinView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 100,
              child: Column(
                children: [
                  Icon(
                    Icons.sentiment_satisfied_alt,
                    size: 200,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'You have completed',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Color(0xFF3c3c3b),
                    ),
                  ),
                  Text(
                    widget.score,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Color(0xFF3c3c3b),
                    ),
                  ),
                  Text(
                    'correct answers',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Color(0xFF3c3c3b),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 200,
              child: Container(
                child: Bounce(
                  function: () async {
                    Share.share(
                      'I answered ${widget.score} correct answers in QuizU!',
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        'Share',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Color(0xFF3c3c3b),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.share,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 30,
              child: Bounce(
                function: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ),
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
