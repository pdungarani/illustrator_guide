import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';
import 'package:illustrator_guide/app/widgets/custom_button.dart';
import 'package:illustrator_guide/app/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          body: Form(
            key: controller.registerKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              physics: const ClampingScrollPhysics(),
              padding: Dimens.edgeInsets20,
              children: [
                Image.asset(
                  AssetConstants.ic_sign_in,
                  height: Get.width / 1.2,
                ),
                Text(
                  "register".tr,
                  style: Styles.txtBlackColorW70030,
                ),
                Dimens.boxHeight5,
                Text(
                  "register_des".tr,
                  style: Styles.txtBlackColorW50016,
                ),
                Dimens.boxHeight30,
                CustomTextFormField(
                  textEditingController: controller.emailReController,
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
                  textEditingController: controller.passwordReController,
                  isTitle: true,
                  title: 'password'.tr,
                  titleStyle: Styles.txtBlackColorW60014,
                  obscureText: controller.isPassword,
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
                      if (controller.isPassword) {
                        controller.isPassword = false;
                      } else {
                        controller.isPassword = true;
                      }
                      controller.update();
                    },
                    child: Padding(
                      padding: Dimens.edgeInsets10,
                      child: SvgPicture.asset(
                        controller.isPassword
                            ? AssetConstants.ic_pass_show
                            : AssetConstants.ic_pass_hide,
                      ),
                    ),
                  ),
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  textEditingController: controller.confirmReController,
                  isTitle: true,
                  title: 'confirm_password'.tr,
                  titleStyle: Styles.txtBlackColorW60014,
                  obscureText: controller.isConfirmPassword,
                  hintText: 'enter_confirm_password'.tr,
                  hintStyle: Styles.blue94A3B8W50016,
                  fillColor: ColorsValue.textField,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  filled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter_confirm_password'.tr;
                    } else if (!controller.passwordReController.text
                        .contains(value)) {
                      return 'confirm_password_error'.tr;
                    }
                    return null;
                  },
                  suffixIcon: InkWell(
                    onTap: () {
                      if (controller.isConfirmPassword) {
                        controller.isConfirmPassword = false;
                      } else {
                        controller.isConfirmPassword = true;
                      }
                      controller.update();
                    },
                    child: Padding(
                      padding: Dimens.edgeInsets10,
                      child: SvgPicture.asset(
                        controller.isConfirmPassword
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
                  text: 'register'.tr,
                  style: Styles.whiteColorW70016,
                  backgroundColor: ColorsValue.appColor,
                  onPressed: () {
                    if (controller.registerKey.currentState!.validate()) {}
                  },
                ),
                Dimens.boxHeight10,
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'already_have_account'.tr,
                      style: Styles.txtBlackColorW40014,
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.back();
                            },
                          text: 'login'.tr,
                          style: Styles.appColorW70014,
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
