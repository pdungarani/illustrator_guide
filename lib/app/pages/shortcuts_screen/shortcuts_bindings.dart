import 'package:get/get.dart';
import 'package:illustrator_guide/app/pages/shortcuts_screen/shortcuts_pages.dart';
import 'package:illustrator_guide/domain/usecases/usecases.dart';

class ShortcutsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShortcutsController>(
      () => ShortcutsController(
        Get.put(
          ShortcutsPresenter(
            Get.put(
              ShortcutsUsecases(
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
