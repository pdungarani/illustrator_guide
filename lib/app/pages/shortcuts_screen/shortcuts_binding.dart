import 'package:get/get.dart';
import 'package:illustrator_guide/app/pages/shortcuts_screen/shortcuts_page.dart';
import 'package:illustrator_guide/domain/domain.dart';

// coverage:ignore-file
/// A list of bindings which will be used in the route of [SplashView].
class ShortcutsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShortcutsController>(
      () => ShortcutsController(
        Get.put(
          ShortcutsPresenter(
            Get.put(
              ShortcutsUseCases(
                Get.find(),
              ),
              permanent: true,
            ),
          ),
        ),
      ),
    );
  }
}
