import 'package:flutter/cupertino.dart';

class LoginController {
  final PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  final phoneController = TextEditingController();
  final smsCodeController = TextEditingController();
  final nameController = TextEditingController();

  String? smsValidator(String? sms) {
    if (((sms?.length ?? 0) < 6) || sms != '0000') return "Incorrect SMS Code";
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
}
