import 'package:flutter/material.dart';

class CustomizedTextField extends StatelessWidget {
  const CustomizedTextField({
    Key? key,
    required this.textEditingController,
    required this.hint,
    required this.obscureText,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String hint;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 15,
        right: 5,
      ),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 0.5,
        ),
      ),
      child: TextFormField(
        controller: textEditingController,
        textAlignVertical: TextAlignVertical.top,
        maxLines: 1,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 22,
          height: 1.15
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 22,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              textEditingController.clear();
            },
            child: Icon(
              Icons.cancel,
              color: Colors.grey.shade500,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}
