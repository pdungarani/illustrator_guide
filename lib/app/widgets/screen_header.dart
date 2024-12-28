import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:illustrator_guide/app/app.dart';

class ScreenHeader extends StatefulWidget {
  TextStyle? txtStyle;
  String? title;
  String? image;
  double? height;
  double? width;
  bool isVisible;
  void Function()? onTap;

  ScreenHeader({
    Key? key,
    this.txtStyle,
    this.title,
    this.height,
    this.width,
    this.image,
    this.onTap,
    this.isVisible = false,
  }) : super(key: key);

  @override
  State<ScreenHeader> createState() => _ScreenHeaderState();
}

class _ScreenHeaderState extends State<ScreenHeader> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsValue.appColor,
      automaticallyImplyLeading: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: widget.isVisible,
            child: GestureDetector(
              onTap: widget.onTap,
              child: SvgPicture.asset(
                widget.image!,
                height: widget.height,
                width: widget.width,
              ),
            ),
          ),
          Dimens.boxWidth15,
          Flexible(
            child: Center(
              child: Text(
                widget.title ?? "",
                style: widget.txtStyle,
              ),
            ),
          ),
          Dimens.boxWidth15,
        ],
      ),
      actions: [
        Container(
          width: 20,
        )
      ],
    );
  }
}
