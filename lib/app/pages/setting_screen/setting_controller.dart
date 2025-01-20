import 'dart:ui';

import 'package:get/get.dart';
import 'package:illustrator_guide/app/pages/setting_screen/setting_page.dart';
import 'package:illustrator_guide/app/utils/utils.dart';

class SettingController extends GetxController {
  SettingController(this.settingPresenter);

  final SettingPresenter settingPresenter;

  List<ModelDrower> drowerList = [
    ModelDrower(
      name: "language".tr,
      icon: AssetConstants.ic_language,
    ),
    ModelDrower(
      name: "policy".tr,
      icon: AssetConstants.policy,
    ),
  ];

  void selectedIndex(int index) {
    Utility.selectedDrawerIndex = index;
    update();
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
