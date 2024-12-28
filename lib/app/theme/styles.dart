//coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illustrator_guide/app/app.dart';

/// A chunk of styles used in the application.
/// Will be ignored for test since all are static values and would not change.
abstract class Styles {
  static TextStyle txtBlackColorW70020 = GoogleFonts.montserrat(
    color: ColorsValue.txtBlackColor,
    fontSize: Dimens.twenty,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtBlackColorW70030 = GoogleFonts.montserrat(
    color: ColorsValue.txtBlackColor,
    fontSize: Dimens.thirty,
    fontWeight: FontWeight.w700,
  );

  static TextStyle appColorW70014 = GoogleFonts.montserrat(
    color: ColorsValue.appColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle appColorW50014 = GoogleFonts.montserrat(
    color: ColorsValue.appColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle appColorW70016 = GoogleFonts.montserrat(
    color: ColorsValue.appColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtBlackColorW40016 = GoogleFonts.montserrat(
    color: ColorsValue.txtBlackColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtBlackColorW50016 = GoogleFonts.montserrat(
    color: ColorsValue.txtBlackColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtBlackColorW80016 = GoogleFonts.montserrat(
    color: ColorsValue.txtBlackColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w800,
  );

  static TextStyle txtBlackColorW60014 = GoogleFonts.montserrat(
    color: ColorsValue.txtBlackColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtBlackColorW40014 = GoogleFonts.montserrat(
    color: ColorsValue.txtBlackColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w400,
  );

  static TextStyle blue94A3B8W40014 = GoogleFonts.outfit(
    color: ColorsValue.blue94A3B8,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w400,
  );

  static TextStyle blue94A3B8W50016 = GoogleFonts.outfit(
    color: ColorsValue.blue94A3B8,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle whiteColorW70020 = GoogleFonts.montserrat(
    color: ColorsValue.whiteColor,
    fontSize: Dimens.twenty,
    fontWeight: FontWeight.w700,
  );

  static TextStyle whiteColorW70016 = GoogleFonts.montserrat(
    color: ColorsValue.whiteColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w700,
  );

  /// Dialog Text
  static TextStyle black50018 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle redColor50014 = GoogleFonts.montserrat(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.fourteen,
  );

  static TextStyle redColor40012 = GoogleFonts.montserrat(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w400,
    fontSize: Dimens.twelve,
  );

  static TextStyle black50014 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w500,
  );
}
