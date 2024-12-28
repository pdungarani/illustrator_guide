import 'package:flutter/material.dart';
import 'package:illustrator_guide/app/app.dart';

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  CustomButton({
    super.key,
    required this.text,
    this.style,
    this.backgroundColor,
    this.height,
    required this.onPressed,
    this.radius,
  });

  final TextStyle? style;
  final Color? backgroundColor;
  final String text;
  final double? height;
  void Function()? onPressed;
  double? radius;

  @override
  State<CustomButton> createState() => CcustomButtonState();
}

class CcustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          double.maxFinite,
          widget.height ?? Dimens.fifty,
        ),
        backgroundColor: widget.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            widget.radius ?? Dimens.eight,
          ),
        ),
      ),
      child: Text(
        widget.text,
        style: widget.style ?? Styles.whiteColorW70016,
      ),
    );
  }
}
