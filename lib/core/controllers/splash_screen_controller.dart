import 'package:flutter/material.dart';
import 'package:quiz_u/app/home/views/home_view.dart';
import 'package:quiz_u/app/login/models/user.dart';
import 'package:quiz_u/app/login/services/login_services.dart';
import 'package:quiz_u/app/login/views/login_view.dart';
import 'package:quiz_u/core/database/isar_db.dart';

class SplashScreenController {
  late BuildContext context;
  late bool isLogin;

  SplashScreenController({
    required this.context,
  });

  void preLunch() {
    Future.wait(
      [
        IsarDB.initDB(),
        Future.delayed(
          const Duration(
            milliseconds: 500,
          ),
        ),
      ],
    ).then((value) => lunch());
  }

  Future<bool> checkIsLogin() async {
    User user = await IsarDB.getUser();
    if (user.token != '') {
      return await LoginServices.tokenVerification(
        user.name,
        user.token,
      );
    } else {
      return false;
    }
  }

  void lunch() async {
    isLogin = await checkIsLogin();
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
        pageBuilder: (_, __, ___) => isLogin ? const HomeView() : const LoginView(),
      ),
    );
  }
}
