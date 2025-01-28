import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) {
        var controller = Get.find<HomeController>();
        controller.languageList.map(
          (e) {
            if (controller.language == e.widget) {
              e.Value = true;
            } else {
              e.Value = false;
            }
          },
        ).toList();
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
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
              "language".tr,
              style: Styles.whiteColorW70020,
            ),
          ),
          body: ListView.separated(
            padding: Dimens.edgeInsetsTop10,
            physics: const ClampingScrollPhysics(),
            itemCount: controller.languageList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.languageList
                      .forEach((element) => element.Value = false);
                  controller.languageList[index].Value = true;
                  controller.languageList[index].Value = true;
                  controller.updateLanguage(
                      Locale(controller.languageList[index].widget ?? "en"));
                  controller.setUpdatelanguage(
                      controller.languageList[index].widget ?? "en");
                  controller.update();
                },
                child: Column(
                  children: [
                    Container(
                      margin: Dimens.edgeInsets20_8_20_8,
                      padding: Dimens.edgeInsets20_10_20_10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Dimens.ten,
                        ),
                        color: ColorsValue.appGrayColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flag.fromCode(
                            controller.languageList[index].flagProperty!,
                            width: Dimens.fifty,
                            height: Dimens.fifty - 10,
                          ),
                          Dimens.boxWidth10,
                          Text(
                            controller.languageList[index].name ?? "",
                            style: Styles.txtBlackColorW60014,
                          ),
                          const Spacer(),
                          controller.languageList[index].Value!
                              ? SvgPicture.asset(
                                  AssetConstants.check,
                                  colorFilter: ColorFilter.mode(
                                    ColorsValue.appColor,
                                    BlendMode.srcIn,
                                  ),
                                )
                              : SvgPicture.asset(
                                  AssetConstants.uncheck,
                                  colorFilter: ColorFilter.mode(
                                    Get.isDarkMode
                                        ? Colors.black
                                        : Colors.white60,
                                    BlendMode.srcIn,
                                  ),
                                )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 1,
              );
            },
          ),
        );
      },
    );
  }
}
