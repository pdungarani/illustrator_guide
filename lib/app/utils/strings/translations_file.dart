// coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';

class TranslationsFile extends Translations {
  static const listOfLocales = <Locale>[
    Locale('en'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'appName': StringConstants.appName,
          "login": "Login",
          "login_des": "Please sign in to continue.",
          "register": "Register",
          "register_des": "Please register to login.",
          "email": "Email",
          "enter_email": "Enter email",
          "enter_valid_email": "Enter valid email",
          "name": "Name",
          "enter_name": "Enter name",
          "password": "Password",
          "enter_password": "Enter password",
          "confirm_password": "Confirm Password",
          "enter_confirm_password": "Enter confirm password",
          "confirm_password_error":
              "Confirm password and password must be same",
          "forgot_password": "Forgot Password?",
          "dont_have_account": "Dont't have an account? ",
          "already_have_account": "Already have account? ",
          "": "",
          "": "",
          "": "",
          "": "",
        },
      };
}
