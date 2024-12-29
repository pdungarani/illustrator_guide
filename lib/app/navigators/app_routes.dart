part of 'app_pages.dart';

abstract class Routes {
  static const splashScreen = _Paths.splashScreen;
  static const loginScreen = _Paths.loginScreen;
  static const registerScreen = _Paths.registerScreen;
  static const homeScreen = _Paths.homeScreen;
  static const toolDetailsScreen = _Paths.toolDetailsScreen;
  static const languageScreen = _Paths.languageScreen;
}

abstract class _Paths {
  static const splashScreen = '/splashScreen';
  static const loginScreen = '/loginScreen';
  static const registerScreen = '/registerScreen';
  static const homeScreen = '/homeScreen';
  static const toolDetailsScreen = '/toolDetailsScreen';
  static const languageScreen = '/languageScreen';
}
