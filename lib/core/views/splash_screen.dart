import 'package:flutter/material.dart';
import 'package:quiz_u/core/animations/show_up.dart';
import 'package:quiz_u/core/controllers/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashScreenController controller;

  @override
  void initState() {
    controller = SplashScreenController(
      context: context,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller.preLunch();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(
          milliseconds: 1000,
        ),
        decoration: const BoxDecoration(
          color: Colors.blueGrey,
        ),
        padding: const EdgeInsets.only(
          bottom: 450,
        ),
        child: Align(
          alignment: Alignment.center,
          child: ShowUp(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  constraints: const BoxConstraints(
                    maxWidth: 500,
                    maxHeight: 500,
                  ),
                  child: const Icon(
                    Icons.timelapse_rounded,
                    color: Colors.white,
                    size: 120,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
