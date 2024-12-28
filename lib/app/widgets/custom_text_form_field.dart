// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:illustrator_guide/app/app.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.isTitle = false,
    this.isCompulsory = false,
    this.title,
    this.titleStyle,
    this.textEditingController,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.obscureText,
    this.readOnly,
    this.textAlign,
    this.filled,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.hintStyle,
    this.errorStyle,
    this.focusNode,
    this.radius,
  });

  bool isTitle;
  bool isCompulsory;
  String? title;
  TextStyle? titleStyle;
  TextEditingController? textEditingController;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  List<TextInputFormatter>? inputFormatters;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  int? maxLength;
  int? maxLines;
  int? minLines;
  bool? obscureText = false;
  bool? readOnly = false;
  TextAlign? textAlign;
  bool? filled;
  Color? fillColor;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String? hintText;
  TextStyle? hintStyle;
  TextStyle? errorStyle;
  FocusNode? focusNode;
  double? radius;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isTitle) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? "",
                style: titleStyle,
              ),
              if (isCompulsory) ...[
                Text(
                  " *",
                  style: Styles.txtBlackColorW40016,
                )
              ],
            ],
          ),
          Dimens.boxHeight5,
        ],
        TextFormField(
          focusNode: focusNode,
          controller: textEditingController,
          cursorColor: ColorsValue.appColor,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          maxLines: maxLines,
          minLines: minLines,
          obscureText: obscureText ?? false,
          readOnly: readOnly ?? false,
          textAlign: textAlign ?? TextAlign.start,
          validator: validator,
          onChanged: onChanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            contentPadding: Dimens.edgeInsets20_10_20_10,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                radius ?? Dimens.eight,
              ),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                radius ?? Dimens.eight,
              ),
              borderSide: BorderSide.none,
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                radius ?? Dimens.eight,
              ),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                radius ?? Dimens.eight,
              ),
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                radius ?? Dimens.eight,
              ),
              borderSide: BorderSide.none,
            ),
            filled: filled,
            fillColor: fillColor,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: hintStyle,
            errorStyle: errorStyle,
          ),
        ),
      ],
    );
  }
}
