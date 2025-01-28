import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';
import 'package:illustrator_guide/app/pages/setting_screen/setting_controller.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
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
              "setting".tr,
              style: Styles.whiteColorW70020,
            ),
          ),
          body: Padding(
            padding: Dimens.edgeInsets20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onTap: () {
                    RouteManagement.goToLanguageScreen();
                  },
                  contentPadding: Dimens.edgeInsets0,
                  dense: true,
                  leading: SvgPicture.asset(
                    AssetConstants.ic_language,
                    height: Dimens.thirty,
                    width: Dimens.thirty,
                    colorFilter: ColorFilter.mode(
                      ColorsValue.appColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text(
                    "language".tr,
                    style: Styles.appColorW70016,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: ColorsValue.appColor,
                  ),
                ),
                ListTile(
                  contentPadding: Dimens.edgeInsets0,
                  dense: true,
                  leading: SvgPicture.asset(
                    AssetConstants.policy,
                    height: Dimens.thirty,
                    width: Dimens.thirty,
                    colorFilter: ColorFilter.mode(
                      ColorsValue.appColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text(
                    "policy".tr,
                    style: Styles.appColorW70016,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: ColorsValue.appColor,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
