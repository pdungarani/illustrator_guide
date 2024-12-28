import 'package:get/get.dart';
import 'package:illustrator_guide/domain/domain.dart';

import 'app_pages.dart';

abstract class RouteManagement {
  static void goToLoginScreen() => Get.offAllNamed<void>(Routes.loginScreen);
  static void goToRegisterScreen() => Get.toNamed<void>(Routes.registerScreen);
  static void goToHomeScreen() => Get.toNamed<void>(Routes.homeScreen);
  static void goToolDetailsScreen(BasicToolsModel basicToolsModel) =>
      Get.toNamed<void>(
        Routes.toolDetailsScreen,
        arguments: basicToolsModel,
      );
}
