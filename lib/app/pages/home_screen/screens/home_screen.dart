import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBar(
            backgroundColor: ColorsValue.appColor,
            title: Text(
              "Home",
              style: Styles.whiteColorW70020,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: Dimens.edgeInsets20,
            child: Column(
              children: [
                Container(
                  height: Dimens.hundredTwenty,
                  decoration: BoxDecoration(
                    color: ColorsValue.appColor,
                    borderRadius: BorderRadius.circular(
                      Dimens.twenty,
                    ),
                  ),
                ),
                Dimens.boxHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Basic Tool',
                      style: Styles.appColorW70016,
                    ),
                    Text(
                      'View All',
                      style: Styles.appColorW50014,
                    ),
                  ],
                ),
                Dimens.boxHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.selectIndex = 0;
                        controller.update();
                        RouteManagement.goToolDetailsScreen();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: Dimens.fifty,
                        width: Dimens.fifty,
                        decoration: BoxDecoration(
                          color: controller.selectIndex == 0
                              ? ColorsValue.appColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(
                            Dimens.ten,
                          ),
                          border: Border.all(
                            width: Dimens.one,
                            color: ColorsValue.appColor,
                          ),
                        ),
                        child: SvgPicture.asset(
                          AssetConstants.ic_move_tool,
                          colorFilter: ColorFilter.mode(
                            ColorsValue.whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.selectIndex = 1;
                        controller.update();
                      },
                      child: Container(
                        height: Dimens.fifty,
                        width: Dimens.fifty,
                        decoration: BoxDecoration(
                          color: controller.selectIndex == 1
                              ? ColorsValue.appColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(
                            Dimens.ten,
                          ),
                          border: Border.all(
                            width: Dimens.one,
                            color: ColorsValue.appColor,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.selectIndex = 2;
                        controller.update();
                      },
                      child: Container(
                        height: Dimens.fifty,
                        width: Dimens.fifty,
                        decoration: BoxDecoration(
                          color: controller.selectIndex == 2
                              ? ColorsValue.appColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(
                            Dimens.ten,
                          ),
                          border: Border.all(
                            width: Dimens.one,
                            color: ColorsValue.appColor,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.selectIndex = 3;
                        controller.update();
                      },
                      child: Container(
                        height: Dimens.fifty,
                        width: Dimens.fifty,
                        decoration: BoxDecoration(
                          color: controller.selectIndex == 3
                              ? ColorsValue.appColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(
                            Dimens.ten,
                          ),
                          border: Border.all(
                            width: Dimens.one,
                            color: ColorsValue.appColor,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.selectIndex = 4;
                        controller.update();
                      },
                      child: Container(
                        height: Dimens.fifty,
                        width: Dimens.fifty,
                        decoration: BoxDecoration(
                          color: controller.selectIndex == 4
                              ? ColorsValue.appColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(
                            Dimens.ten,
                          ),
                          border: Border.all(
                            width: Dimens.one,
                            color: ColorsValue.appColor,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.selectIndex = 5;
                        controller.update();
                      },
                      child: Container(
                        height: Dimens.fifty,
                        width: Dimens.fifty,
                        decoration: BoxDecoration(
                          color: controller.selectIndex == 5
                              ? ColorsValue.appColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(
                            Dimens.ten,
                          ),
                          border: Border.all(
                            width: Dimens.one,
                            color: ColorsValue.appColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Dimens.boxHeight20,
                Expanded(
                  child: MasonryGridView.count(
                    crossAxisCount: 2,
                    itemCount: controller.strList.length,
                    mainAxisSpacing: Dimens.fifteen,
                    crossAxisSpacing: Dimens.fifteen,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
                          height: (index % 2) == 0
                              ? Dimens.hundredFifty
                              : Dimens.hundred,
                          decoration: BoxDecoration(
                            color: ColorsValue.appColor,
                            borderRadius: BorderRadius.circular(Dimens.eight),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person,
                                color: ColorsValue.whiteColor,
                              ),
                              Dimens.boxHeight10,
                              Text(
                                'Basic Tool',
                                style: Styles.whiteColorW70016,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
