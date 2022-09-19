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
    return PinCodeTextField(
      errorTextSpace: 30,
      validator: controller.smsValidator,
      appContext: context,
      autoFocus: true,
      autoDisposeControllers: true,
      length: 4,
      obscureText: false,
      animationType: AnimationType.scale,
      cursorHeight: 25,
      keyboardType: TextInputType.number,
      // textStyle: kLabelTextStyleMid.copyWith(
      //   height: 1.1,
      // ),
      // pastedTextStyle: kLabelTextStyleMid.copyWith(
      //   height: 1.1,
      // ),
      pinTheme: PinTheme(
        fieldHeight: 45,
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
      onCompleted: (value) {},
      onChanged: (value) {},
      beforeTextPaste: (text) {
        return true;
      },
    );
  }
}
