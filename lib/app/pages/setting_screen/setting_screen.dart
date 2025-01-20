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
          appBar: PreferredSize(
            preferredSize: Size(double.maxFinite, Dimens.sixty),
            child: ScreenHeader(
              onTap: () {
                Utility.selectedDrawerIndex = 0;
                controller.update();
                Get.back();
              },
              isVisible: true,
              image: AssetConstants.back_arrow,
              width: Dimens.thirty,
              height: Dimens.thirty,
              title: "setting".tr,
              txtStyle: Styles.whiteColorW70020,
            ),
          ),
          body: SafeArea(
            child: Expanded(
              child: ListView.builder(
                itemCount: controller.drowerList.length + 1,
                itemBuilder: (context, index) {
                  if (controller.drowerList.length == index) {
                    return const Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 0, 15, 5),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        controller.selectedIndex(index);
                        switch (index) {
                          // case 0:
                          //   RouteManagement.goToHomeScreen();
                          //   break;
                          case 0:
                            RouteManagement.goToLanguageScreen();
                            break;
                          case 1:
                            Utility.selectedDrawerIndex = 0;
                            Utility.launchLinkURL(
                                "https://sparkflows854.blogspot.com/2024/12/illustrator-guide.html");
                            break;
                          default:
                            RouteManagement.goToHomeScreen();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Utility.selectedDrawerIndex == index
                              ? ColorsValue.appColor.withOpacity(0.9)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(
                            Dimens.eight,
                          ),
                        ),
                        margin: EdgeInsets.only(
                          left: Dimens.fifteen,
                          right: Dimens.fifteen,
                          bottom: Dimens.fifteen,
                        ),
                        padding: EdgeInsets.only(
                          left: Utility.selectedDrawerIndex == index
                              ? Dimens.twelve
                              : Dimens.four,
                          top: Utility.selectedDrawerIndex == index
                              ? Dimens.twelve
                              : Dimens.four,
                          bottom: Utility.selectedDrawerIndex == index
                              ? Dimens.twelve
                              : Dimens.four,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  controller.drowerList[index].icon!,
                                  colorFilter: ColorFilter.mode(
                                    controller.drowerList[index].iconColor ??
                                        (Utility.selectedDrawerIndex == index
                                            ? Colors.white
                                            : ColorsValue.appColor),
                                    BlendMode.srcIn,
                                  ),
                                  height: Dimens.thirty,
                                  width: Dimens.thirty,
                                ),
                                Dimens.boxWidth10,
                                SizedBox(
                                  child: Text(
                                    controller.drowerList[index].name ?? "",
                                    style: Utility.selectedDrawerIndex == index
                                        ? Styles.whiteColorW60016
                                        : Styles.black2E2B30W60016,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
                },
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.all(
                  Dimens.fourteen,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
