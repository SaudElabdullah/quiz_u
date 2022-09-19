import 'package:flutter/cupertino.dart';
import 'package:phone_number/phone_number.dart';

class LoginController {
  final PageController pageController = PageController(initialPage: 0, keepPage: true);
  final phoneController = TextEditingController();
  final smsCodeController = TextEditingController();

  Future<bool> validatePhoneNumber(String phoneNumber) async {
    return await PhoneNumberUtil().validate('+966${phoneNumber.substring(1)}');
  }

  String? smsValidator(String? sms) {
    if ((sms?.length ?? 0) < 6) return "Incorrect SMS Code";
    return null;
  }
}
