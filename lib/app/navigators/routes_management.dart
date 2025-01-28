import 'package:get/get.dart';
import 'package:illustrator_guide/domain/domain.dart';

import 'app_pages.dart';

abstract class RouteManagement {
  static void goToLoginScreen() => Get.offAllNamed<void>(Routes.loginScreen);
  static void goToRegisterScreen() => Get.toNamed<void>(Routes.registerScreen);
  static void goToHomeScreen() => Get.offAllNamed<void>(Routes.homeScreen);
  static void goToLanguageScreen() => Get.toNamed<void>(Routes.languageScreen);
  static void goToolDetailsScreen(BasicToolsModel basicToolsModel) =>
      Get.toNamed<void>(
        Routes.toolDetailsScreen,
        arguments: basicToolsModel,
      );
  static void goToSettingScreen() => Get.toNamed<void>(Routes.settingScreen);
  static void goTofullScreen(String videoId, bool isVideo) =>
      Get.toNamed<void>(Routes.fullScreen, arguments: [videoId, isVideo]);
  static void goToShortcutsScreen() =>
      Get.toNamed<void>(Routes.shortcutsScreen);
}
