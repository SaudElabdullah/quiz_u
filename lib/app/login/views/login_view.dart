import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_u/app/login/controllers/login_controller.dart';
import 'package:quiz_u/app/login/views/pages/name_page.dart';
import 'package:quiz_u/app/login/views/pages/phone_number_page.dart';
import 'package:quiz_u/app/login/views/pages/pin_code_page.dart';
import 'package:quiz_u/core/animations/bounce.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginController controller;

  @override
  initState() {
    controller = LoginController(
      state: this,
      context: context,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 150,
              child: Row(
                children: const [
                  Text(
                    'Quiz U',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Color(0xFF3c3c3b),
                    ),
                  ),
                  Icon(
                    Icons.timelapse_rounded,
                    size: 35,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 350,
              right: 35,
              left: 35,
              height: 150,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                children: [
                  PhoneNumberPage(
                    controller: controller,
                  ),
                  PinCodePage(
                    controller: controller,
                  ),
                  NamePage(
                    controller: controller,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 200,
              right: 80,
              left: 80,
              child: Bounce(
                function: () async {
                  await controller.loginController();
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
                    'Next',
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
            if (controller.showLottie) ...[
              Positioned(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(
                    0.2,
                  ),
                  child: Lottie.asset(
                    'assets/lotties/loading.json',
                    repeat: true,
                    animate: true,
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    frameRate: FrameRate.max,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
