import 'package:flutter/material.dart';
import 'package:quiz_u/app/login/components/customized_text_field.dart';
import 'package:quiz_u/app/login/controllers/login_controller.dart';

class NamePage extends StatelessWidget {
  final LoginController controller;

  const NamePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "What's your name?",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        CustomizedTextField(
          textEditingController: controller.nameController,
          hint: 'Your Name',
          obscureText: false,
        ),
      ],
    );
  }
}
