import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';

class AppDrower extends StatefulWidget {
  const AppDrower({Key? key}) : super(key: key);

  @override
  State<AppDrower> createState() => _AppDrowerState();
}

class _AppDrowerState extends State<AppDrower> {
  List<ModelDrower> drowerList = [];

  @override
  void initState() {
    drowerList = [
      ModelDrower(
        name: "home".tr,
        icon: AssetConstants.ic_home,
      ),
      ModelDrower(
        name: "language".tr,
        icon: AssetConstants.ic_language,
      ),
      ModelDrower(
        name: "policy".tr,
        icon: AssetConstants.policy,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.theme;
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(
            Dimens.fifteen,
          ),
          topRight: Radius.circular(
            Dimens.fifteen,
          ),
        ),
        color: Colors.white,
      ),
      child: Drawer(
        backgroundColor: ColorsValue.appBg,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: Dimens.fiftyFive,
                right: Dimens.twenty,
                left: Dimens.twenty,
                bottom: Dimens.twenty,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: Dimens.thirty,
                    backgroundColor: Colors.amberAccent,
                    backgroundImage: const AssetImage(
                      AssetConstants.avatar,
                    ),
                  ),
                  Dimens.boxWidth10,
                  Expanded(
                    child: Text(
                      "illustrator_guid".tr,
                      style: Styles.txtBlackColorW80016,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.clear),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: drowerList.length + 1,
                itemBuilder: (context, index) {
                  if (drowerList.length == index) {
                    return const Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 0, 15, 5),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          Utility.selectedDrawerIndex = index;
                          Get.back();
                        });
                        switch (index) {
                          case 0:
                            RouteManagement.goToHomeScreen();
                            break;
                          case 1:
                            RouteManagement.goToLanguageScreen();
                            break;
                          case 2:
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
                              ? ColorsValue.appColor
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
                                  drowerList[index].icon!,
                                  colorFilter: ColorFilter.mode(
                                    drowerList[index].iconColor ??
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
                                    drowerList[index].name ?? "",
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
          ],
        ),
      ),
    );
  }
}

class ModelDrower {
  String? name;
  String? icon;
  Color? iconColor;
  Function()? onTap;

  ModelDrower({this.name, this.icon, this.onTap, this.iconColor});

  ModelDrower.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    onTap = json['onTap'];
    iconColor = json['iconColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['onTap'] = this.onTap;
    data['iconColor'] = this.iconColor;
    return data;
  }
}
