import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:quiz_u/app/login/controllers/login_controller.dart';

class PhoneNumberPage extends StatelessWidget {
  final LoginController controller;

  const PhoneNumberPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: IntlPhoneField(
        controller: controller.phoneController,
        decoration: const InputDecoration(
          labelText: 'Phone Number',
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
        initialCountryCode: 'SA',
      ),
    );
  }
}
