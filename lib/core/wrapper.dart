import 'package:flutter/material.dart';
import 'package:quiz_u/core/views/customized_bottom_navigation.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return const CustomizedBottomNavigation();
  }
}
