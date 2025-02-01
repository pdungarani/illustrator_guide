import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';

class IntroducationScreen extends StatelessWidget {
  const IntroducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
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
            title: Text(
              "introduction".tr,
              style: Styles.whiteColorW70020,
            ),
          ),
          body: ListView(
            padding: Dimens.edgeInsets20,
            physics: const ClampingScrollPhysics(),
            children: [
              SizedBox(
                height: Dimens.twoHundredFifty,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Dimens.ten,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      Dimens.ten,
                    ),
                    child: Image.asset(
                      AssetConstants.banner,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Dimens.boxHeight20,
              Text(
                'intro'.tr,
                style: Styles.blackColorW50016,
              ),
              Dimens.boxHeight20,
              Text(
                'intro1'.tr,
                style: Styles.blackColorW50016,
              ),
              Dimens.boxHeight20,
              Text(
                'intro2'.tr,
                style: Styles.blackColorW50016,
              ),
              Dimens.boxHeight20,
              Text(
                'intro3'.tr,
                style: Styles.blackColorW50016,
              ),
            ],
          ),
        );
      },
    );
  }
}
