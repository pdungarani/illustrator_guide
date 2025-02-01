import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';
import 'package:lottie/lottie.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorsValue.appColor,
        leading: Padding(
          padding: Dimens.edgeInsets8,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorsValue.whiteColor,
            ),
          ),
        ),
      ),
      body: Center(
        child: Lottie.asset(
          AssetConstants.coming_soon,
          repeat: true,
        ),
      ),
    );
  }
}
