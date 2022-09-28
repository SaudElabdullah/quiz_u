import 'package:flutter/material.dart';
import 'package:quiz_u/app/home/views/home_view.dart';
import 'package:quiz_u/app/login/models/user.dart';
import 'package:quiz_u/app/login/services/login_services.dart';
import 'package:quiz_u/core/database/isar_db.dart';
import 'package:quiz_u/core/utils/pop_up.dart';

class LoginController {
  late PageController pageController;
  late TextEditingController phoneController;
  late TextEditingController smsCodeController;
  late TextEditingController nameController;
  late State state;
  late BuildContext context;
  late bool showLottie;
  late String userToken;

  LoginController({
    required this.state,
    required this.context,
  }) {
    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    smsCodeController = TextEditingController();
    phoneController = TextEditingController();
    nameController = TextEditingController();
    showLottie = false;
  }

  String? smsValidator(String? sms) {
    if (((sms?.length ?? 0) < 4)) return "Incorrect SMS Code";
    return null;
  }

  void navigateToNextPage() {
    pageController.nextPage(
      duration: const Duration(
        milliseconds: 200,
      ),
      curve: Curves.ease,
    );
  }

  Future<void> loginController() async {
    String page = pageController.page!.toString();
    switch (page) {
      case "0.0":
        {
          navigateToNextPage();
        }
        break;

      case "1.0":
        {
          state.setState(() {
            showLottie = true;
          });
          await Future.wait([
            LoginServices.login(smsCodeController.text, "0" + phoneController.text),
            Future.delayed(
              Duration(
                milliseconds: 1000,
              ),
            ),
          ]).then((value) async {
            if (value[0]['success'] as bool) {
              if (value[0]['name'] != null) {
                User info = await LoginServices.getUserInformation(value[0]['token']);
                IsarDB.addUser(
                  value[0]['name'],
                  value[0]['token'],
                  info.score,
                  value[0]['mobile'],
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              } else {
                userToken = value[0]['token'];
                IsarDB.addUser(
                  null,
                  value[0]['token'],
                  null,
                  "0" + phoneController.text,
                );
              }
              pageController.jumpToPage(2);
            } else {
              state.setState(() {
                showLottie = false;
              });
              await showAlert(
                context: context,
                isDismissible: true,
                buttonText: 'Done',
                title: 'SMS Code',
                messageOne: 'The SMS Code you entered is incorrect',
                messageTwo: 'Please renter it again',
              );
              pageController.jumpToPage(0);
            }
          });
          state.setState(() {
            showLottie = false;
          });
        }
        break;
      case "2.0":
        {
          if (nameController.text.isEmpty) {
            await showAlert(
              context: context,
              isDismissible: true,
              buttonText: 'OK',
              title: 'Name',
              messageOne: 'You must enter your name',
              messageTwo: 'Please enter your name',
            );
          } else {
            await IsarDB.updateUserName(nameController.text);
            LoginServices.registerName(nameController.text, userToken);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              ),
            );
          }
        }
        break;

      default:
        {}
        break;
    }
  }
}
