import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (context) {
        return Scaffold(
          backgroundColor: ColorsValue.appColor,
          body: Center(
            child: Text(
              "Splash Screen",
              style: Styles.whiteColorW70020,
            ),
          ),
        );
      },
    );
  }
}