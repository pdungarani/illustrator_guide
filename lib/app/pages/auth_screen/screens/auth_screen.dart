import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';
import 'package:illustrator_guide/app/widgets/custom_button.dart';
import 'package:illustrator_guide/app/widgets/custom_text_form_field.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          body: Form(
            key: controller.loginKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              physics: const ClampingScrollPhysics(),
              padding: Dimens.edgeInsets20,
              children: [
                Image.asset(
                  AssetConstants.ic_sign_up,
                  height: Get.width / 1.2,
                ),
                Text(
                  "login".tr,
                  style: Styles.txtBlackColorW70030,
                ),
                Dimens.boxHeight5,
                Text(
                  "login_des".tr,
                  style: Styles.txtBlackColorW50016,
                ),
                Dimens.boxHeight30,
                CustomTextFormField(
                  textEditingController: controller.emailController,
                  isTitle: true,
                  title: 'email'.tr,
                  titleStyle: Styles.txtBlackColorW60014,
                  hintText: 'enter_email'.tr,
                  hintStyle: Styles.blue94A3B8W50016,
                  fillColor: ColorsValue.textField,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  filled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter_email'.tr;
                    } else if (!Utility.emailValidator(value)) {
                      return 'enter_valid_email'.tr;
                    }
                    return null;
                  },
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  textEditingController: controller.passwordController,
                  isTitle: true,
                  title: 'password'.tr,
                  titleStyle: Styles.txtBlackColorW60014,
                  obscureText: controller.isLoginPassword,
                  hintText: 'enter_password'.tr,
                  hintStyle: Styles.blue94A3B8W50016,
                  fillColor: ColorsValue.textField,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  filled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter_password'.tr;
                    }
                    return null;
                  },
                  suffixIcon: InkWell(
                    onTap: () {
                      if (controller.isLoginPassword) {
                        controller.isLoginPassword = false;
                      } else {
                        controller.isLoginPassword = true;
                      }
                      controller.update();
                    },
                    child: Padding(
                      padding: Dimens.edgeInsets10,
                      child: SvgPicture.asset(
                        controller.isLoginPassword
                            ? AssetConstants.ic_pass_show
                            : AssetConstants.ic_pass_hide,
                      ),
                    ),
                  ),
                ),
                Dimens.boxHeight5,
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'forgot_password'.tr,
                    style: Styles.txtBlackColorW40014,
                  ),
                ),
                Dimens.boxHeight30,
                CustomButton(
                  text: 'login'.tr,
                  style: Styles.whiteColorW70016,
                  backgroundColor: ColorsValue.appColor,
                  onPressed: () {
                    if (controller.loginKey.currentState!.validate()) {}
                  },
                ),
                Dimens.boxHeight10,
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'dont_have_account'.tr,
                      style: Styles.txtBlackColorW40014,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'register'.tr,
                          style: Styles.appColorW70014,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              RouteManagement.goToRegisterScreen();
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
