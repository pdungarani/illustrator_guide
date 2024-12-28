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
          "move_tool": "Move Tool",
          "selection_tool": "Selection Tool",
          "pen_tool": "Pen Tool",
          "join_tool": "Join Tool",
          "align": "Align",
          "pathfinder": "Pathfinder",
          "type_tool": "Type Tool",
          "clipping_mask": "Clipping Mask",
          "shape_builder_tool": "Shape Builder Tool",
          "illustrator_guid": "Illustrator Guide",
          "home": "Home",
          "language": "Language",
          "logout": "Logout",
          //tool
          "align_que1": "Introduction to Align Tool in Illustrator",
          "align_ans1": "The Align Tool in Adobe Illustrator is an essential feature used to align and distribute objects with precision. It helps designers arrange elements in relation to each other or the artboard, ensuring consistency, balance, and professional results in their designs.",
          "align_que2": "How to Use Align Tool in  Illustrator?",
          "align_ans2": "In Illustrator, access the align panel by clicking Window > Align (Shift + F7). In Design, access the align panel by clicking Window > Object & Layout > Align (Shift + F7). Tip: Drag the align panel to your windows panel to give you easy access to the alignment panel.",
          "align_step1": "1.Select the objects to align or distribute.",
          "align_step2": "2.Using the Selection tool, Shift-click on the artboard you want to use to activate it.",
          "align_step3": "3.In the Align or Control panel, select Align To Artboard, then click the button for the type of alignment or distribution you want.",
          "": "",
          "": "",
          "": "",
          "": "",
          "": "",
          "": "",
          "": "",
          "": "",
          "": "",
          "": "",
          "": "",
          "": "",
          "": "",
          "": "",
        },
      };
}
