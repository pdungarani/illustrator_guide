import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final greetingMessage = Utility.getGreetingMessage();
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            padding: Dimens.edgeInsets20.copyWith(top: Dimens.fifty),
            physics: const ClampingScrollPhysics(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${'hello'.tr}$greetingMessage",
                        style: Styles.txtBlackColorW70024,
                      ),
                      Dimens.boxHeight5,
                      Text(
                        "your_gateway_to_life".tr,
                        style: Styles.txtBlackColorW40012,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      RouteManagement.goToSettingScreen();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(
                          Dimens.fiveHundred,
                        ),
                      ),
                      child: const Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              Dimens.boxHeight20,
              SizedBox(
                height: Dimens.twoHundredSixtySix,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimens.twenty,
                              ),
                              image: const DecorationImage(
                                image: AssetImage(
                                  AssetConstants.aiIntroImage,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: Dimens.twoHundredSixtySix,
                          ),
                          InkWell(
                            onTap: () {
                              RouteManagement.goToIntroducationScreen();
                            },
                            child: Container(
                              padding: Dimens.edgeInsets15,
                              height: double.maxFinite,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: ColorsValue.blackColor.withAlpha(90),
                                borderRadius:
                                    BorderRadius.circular(Dimens.twenty),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: Dimens.fifty,
                                    width: Dimens.fifty,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(
                                          Dimens.twoHundred),
                                    ),
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "introduction".tr,
                                        style: Styles.whiteColorW70020,
                                      ),
                                      Text(
                                        "let's_try_it_now".tr,
                                        style: Styles.whiteColorW60014,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Dimens.boxWidth10,
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Dimens.twenty),
                                    image: const DecorationImage(
                                      image:
                                          AssetImage(AssetConstants.toolsImage),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: double.maxFinite,
                                  width: double.maxFinite,
                                ),
                                InkWell(
                                  onTap: () {
                                    RouteManagement.goToComingSoonScreen();
                                  },
                                  child: Container(
                                    padding: Dimens.edgeInsets15,
                                    height: double.maxFinite,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      color:
                                          ColorsValue.blackColor.withAlpha(90),
                                      borderRadius:
                                          BorderRadius.circular(Dimens.twenty),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: Dimens.fifty,
                                          width: Dimens.fifty,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.7),
                                            borderRadius: BorderRadius.circular(
                                                Dimens.twoHundred),
                                          ),
                                          child: const Icon(
                                            Icons.person,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            "new_tools".tr,
                                            overflow: TextOverflow.ellipsis,
                                            style: Styles.whiteColorW70018,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Dimens.boxHeight10,
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Dimens.twenty),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          AssetConstants.shortcutsImage),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: double.maxFinite,
                                  width: double.maxFinite,
                                ),
                                InkWell(
                                  onTap: () =>
                                      RouteManagement.goToShortcutsScreen(),
                                  child: Container(
                                    padding: Dimens.edgeInsets15,
                                    height: double.maxFinite,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      color: ColorsValue.blackColor
                                          .withOpacity(0.4),
                                      borderRadius:
                                          BorderRadius.circular(Dimens.twenty),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: Dimens.fifty,
                                          width: Dimens.fifty,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.7),
                                            borderRadius: BorderRadius.circular(
                                                Dimens.twoHundred),
                                          ),
                                          child: const Icon(
                                            Icons.person,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            "shortcuts".tr,
                                            style: Styles.whiteColorW70018,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Dimens.boxHeight20,
              Text(
                "basic_tools".tr,
                style: Styles.txtBlackColorW70020,
              ),
              Dimens.boxHeight20,
              MasonryGridView.count(
                itemCount: controller.basicToolDetilsList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: Dimens.fifteen,
                crossAxisSpacing: Dimens.fifteen,
                crossAxisCount: 2,
                padding: Dimens.edgeInsets0,
                itemBuilder: (context, index) {
                  var item = controller.basicToolDetilsList[index];
                  return InkWell(
                    onTap: () {
                      RouteManagement.goToolDetailsScreen(
                          controller.basicToolDetilsList[index]);
                    },
                    child: Container(
                      padding: Dimens.edgeInsets15,
                      height: (index % 4) == 0
                          ? Dimens.hundredFourty
                          : Dimens.hundredThirty,
                      decoration: BoxDecoration(
                        color: ColorsValue.appGrayColor,
                        borderRadius: BorderRadius.circular(
                          Dimens.twenty,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: Dimens.edgeInsets10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimens.fiveHundred,
                              ),
                              color: ColorsValue.appColor.withOpacity(0.9),
                            ),
                            child: SvgPicture.asset(
                              item.icon ?? "",
                              colorFilter: ColorFilter.mode(
                                ColorsValue.whiteColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          Dimens.boxHeight20,
                          Flexible(
                            child: Text(
                              item.name ?? "",
                              style: Styles.appColorW70016,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
