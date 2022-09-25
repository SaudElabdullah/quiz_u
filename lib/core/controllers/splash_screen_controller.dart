import 'package:flutter/material.dart';
import 'package:quiz_u/app/login/views/login_view.dart';

class SplashScreenController {
  late BuildContext context;

  SplashScreenController({
    required this.context,
  });

  void preLunch(){
    Future.wait(
      [
        Future.delayed(
          const Duration(
            milliseconds: 500,
          ),
        ),
      ],
    ).then((value) => lunch());
  }

  void lunch() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(
          milliseconds: 1000,
        ),
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
        pageBuilder: (_, __, ___) => const LoginView(),
      ),
    );
  }
}
