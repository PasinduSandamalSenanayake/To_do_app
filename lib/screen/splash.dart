import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashScreenController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    splashScreenController.startAnimation();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Obx(
                  () => AnimatedPositioned(
                duration: const Duration(milliseconds: 4000),
                top: splashScreenController.animate.value ? 200 : -250,
                left: 60,
                height: 300,
                width: 300,
                child: Image(
                  image: AssetImage('images/todo_logo.png'),
                ),
              ),
            ),
            Obx(
                  () => AnimatedPositioned(
                duration: const Duration(milliseconds: 4000),
                left: splashScreenController.animate.value? 130 : -50,
                top: 440,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "To",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff18DAA3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
                  () => AnimatedPositioned(
                duration: const Duration(milliseconds: 4000),
                right: splashScreenController.animate.value? 130 : -60,
                top: 440,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Do",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff18DAA3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
                  () => AnimatedPositioned(
                duration: const Duration(milliseconds: 4000),
                right: splashScreenController.animate.value? 130 : -150,
                top: 520,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Right thing,",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
                  () => AnimatedPositioned(
                duration: const Duration(milliseconds: 4000),
                left: splashScreenController.animate.value? 140 : -150,
                top: 550,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Right time,",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
