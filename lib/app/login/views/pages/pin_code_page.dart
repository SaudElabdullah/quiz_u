import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:quiz_u/app/login/controllers/login_controller.dart';

class PinCodePage extends StatelessWidget {
  final LoginController controller;

  const PinCodePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: PinCodeTextField(
        errorTextSpace: 30,
        validator: controller.smsValidator,
        appContext: context,
        autoFocus: true,
        autoDisposeControllers: false,
        length: 4,
        obscureText: false,
        animationType: AnimationType.scale,
        cursorHeight: 25,
        keyboardType: TextInputType.number,
        pinTheme: PinTheme(
          fieldHeight: 55,
          fieldWidth: 40,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          activeColor: Colors.white,
          selectedFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          inactiveColor: Colors.white,
          selectedColor: Colors.white,
          activeFillColor: Colors.white,
        ),
        cursorColor: Colors.black,
        boxShadows: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 8,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
        enableActiveFill: true,
        controller: controller.smsCodeController,
        onChanged: (value) {},
        beforeTextPaste: (text) {
          return true;
        },
      ),
    );
  }
}
