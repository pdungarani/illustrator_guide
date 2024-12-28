import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/pages/pages.dart';

class AuthController extends GetxController {
  AuthController(this.loginPresenter);

  final AuthPresenter loginPresenter;

  bool isLoginPassword = true;

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ///================================================ RegisterScreen =================================================================////

  bool isPassword = true;
  bool isConfirmPassword = true;

  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  TextEditingController emailReController = TextEditingController();
  TextEditingController passwordReController = TextEditingController();
  TextEditingController confirmReController = TextEditingController();
}
