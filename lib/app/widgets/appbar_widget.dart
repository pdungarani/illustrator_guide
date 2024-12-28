import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:illustrator_guide/app/app.dart';

// ignore: must_be_immutable
class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  AppBarWidget({
    super.key,
    required this.onTapBack,
    required this.title,
    this.isVisible = true,
  });

  void Function()? onTapBack;
  String title;
  bool isVisible;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  static final _appBar = AppBar();

  @override
  Size get preferredSize => AppBarWidget._appBar.preferredSize;
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsValue.appBg,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: Visibility(
        visible: widget.isVisible,
        child: Padding(
          padding: Dimens.edgeInsetsLeft20,
          child: InkWell(
            onTap: widget.onTapBack,
            child: SvgPicture.asset(
              AssetConstants.back_arrow,
            ),
          ),
        ),
      ),
      title: Text(
        widget.title,
        style: Styles.txtBlackColorW70020,
      ),
    );
  }
}
