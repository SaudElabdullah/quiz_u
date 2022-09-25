import 'package:flutter/material.dart';

Future<void> showAlert({
  required BuildContext context,
  required bool isDismissible,
  required String buttonText,
  required String title,
  required String messageOne,
  String? messageTwo,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: isDismissible,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(messageOne),
              Text(messageTwo ?? ''),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(buttonText),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
