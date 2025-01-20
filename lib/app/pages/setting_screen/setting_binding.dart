import 'package:get/get.dart';
import 'package:illustrator_guide/app/pages/setting_screen/setting_page.dart';
import 'package:illustrator_guide/domain/usecases/setting_usecase.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(
      () => SettingController(
        Get.put(
          SettingPresenter(
            Get.put(
              SettingUsecases(
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
