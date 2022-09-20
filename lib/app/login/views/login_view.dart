import 'package:flutter/material.dart';
import 'package:quiz_u/app/login/controllers/login_controller.dart';
import 'package:quiz_u/app/login/views/pages/name_page.dart';
import 'package:quiz_u/app/login/views/pages/phone_nymber_page.dart';
import 'package:quiz_u/app/login/views/pages/pin_code_page.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginController controller;

  @override
  initState() {
    controller = LoginController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.blueGrey,
                  ),
                ),
                onPressed: () {
                  controller.navigateToNextPage();
                },
                child: const SizedBox(
                  height: 45,
                  child: Center(
                    child: Text(
                      'next',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
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
