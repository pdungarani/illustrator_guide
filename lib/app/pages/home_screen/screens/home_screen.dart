import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';
import 'package:illustrator_guide/app/widgets/Drower.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) {
        var controller = Get.find<HomeController>();
      },
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          backgroundColor: ColorsValue.appBg,
          drawer: const AppDrower(),
          appBar: PreferredSize(
            preferredSize: Size(double.maxFinite, Dimens.sixty),
            child: ScreenHeader(
              isVisible: true,
              onTap: () {
                if (controller.scaffoldKey.currentState!.isDrawerOpen) {
                  controller.scaffoldKey.currentState!.openEndDrawer();
                } else {
                  controller.scaffoldKey.currentState!.openDrawer();
                }
              },
              image: AssetConstants.headerIcon,
              width: Dimens.thirty,
              height: Dimens.thirty,
              title: "home".tr,
              txtStyle: Styles.whiteColorW70020,
            ),
          ),
          body: Padding(
            padding: Dimens.edgeInsets20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  items: controller.bannerList.asMap().entries.map(
                    (e) {
                      var index = e.key;
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          height: Dimens.twoHundred,
                          decoration: BoxDecoration(
                            color: index == 1
                                ? ColorsValue.appColor
                                : ColorsValue.blue94A3B8,
                            borderRadius: BorderRadius.circular(
                              Dimens.twenty,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              Dimens.twenty,
                            ),
                            child: Image.asset(
                              e.value,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  carouselController: controller.carouselSliderController,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      controller.current = index;
                      controller.update();
                    },
                  ),
                ),
                Dimens.boxHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.bannerList.asMap().entries.map(
                    (entry) {
                      return InkWell(
                        onTap: () {
                          controller.carouselSliderController
                              .animateToPage(entry.key);
                        },
                        child: Padding(
                          padding: Dimens.edgeInsetsLeft2,
                          child: Container(
                            width: Dimens.six,
                            height: Dimens.six,
                            decoration: BoxDecoration(
                              color: controller.current == entry.key
                                  ? ColorsValue.appColor
                                  : ColorsValue.blue94A3B8,
                              borderRadius: BorderRadius.circular(
                                Dimens.hundred,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
                Dimens.boxHeight30,
                Expanded(
                  child: GridView.builder(
                    itemCount: controller.basicToolDetilsList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: Dimens.eight,
                      mainAxisSpacing: Dimens.eight,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        controller.firebaseAnalytics.logEvent(
                          name: 'home_screen',
                          parameters: {
                            'page_name':
                                controller.basicToolDetilsList[index].name ??
                                    "",
                          },
                        ).then(
                          (value) {
                            print("Event Fire Successfully===>");
                          },
                        ).onError(
                          (error, stackTrace) {
                            print("Error===>${error.toString()}");
                          },
                        );
                        RouteManagement.goToolDetailsScreen(
                            controller.basicToolDetilsList[index]);
                      },
                      child: Container(
                        padding: Dimens.edgeInsets5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            Dimens.eight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.3),
                              blurRadius: 5.0,
                              offset: const Offset(0.0, 3.0),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              controller.basicToolDetilsList[index].icon ?? "",
                              height: Dimens.thirty,
                              width: Dimens.thirty,
                            ),
                            Dimens.boxHeight10,
                            Text(
                              controller.basicToolDetilsList[index].name ?? "",
                              style: Styles.txtBlackColorW70012,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
