import 'package:get/get.dart';
import 'package:illustrator_guide/app/pages/shortcuts_screen/shortcuts_page.dart';

class ShortcutsController extends GetxController {
  ShortcutsController(this.shortcutsPresenter);

  final ShortcutsPresenter shortcutsPresenter;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2)).then(
      (value) {},
    );
  }
}
