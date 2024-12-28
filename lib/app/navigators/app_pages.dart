import 'package:get/get.dart';
import 'package:illustrator_guide/app/pages/pages.dart';

part 'app_routes.dart';

class AppPages {
  static var transitionDuration = const Duration(milliseconds: 300);

  static const initial = _Paths.splashScreen;
  static final pages = <GetPage>[
    GetPage<SplashScreen>(
      name: _Paths.splashScreen,
      transitionDuration: transitionDuration,
      page: SplashScreen.new,
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<AuthScreen>(
      name: _Paths.loginScreen,
      transitionDuration: transitionDuration,
      page: AuthScreen.new,
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<RegisterScreen>(
      name: _Paths.registerScreen,
      transitionDuration: transitionDuration,
      page: RegisterScreen.new,
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<HomeScreen>(
      name: _Paths.homeScreen,
      transitionDuration: transitionDuration,
      page: HomeScreen.new,
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<ToolDetailsScreen>(
      name: _Paths.toolDetailsScreen,
      transitionDuration: transitionDuration,
      page: ToolDetailsScreen.new,
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
