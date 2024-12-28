import 'package:get/get.dart';
import 'package:illustrator_guide/app/pages/pages.dart';
import 'package:illustrator_guide/domain/domain.dart';

// coverage:ignore-file
/// A list of bindings which will be used in the route of [AuthView].
class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(
        Get.put(
          AuthPresenter(
            Get.put(
              AuthUsecases(
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
