import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';
import 'package:illustrator_guide/app/pages/shortcuts_screen/shortcuts_pages.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShortcutsController>(
      builder: (controller) {
        return ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          padding: Dimens.edgeInsets20,
          itemCount: controller.selectList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: Dimens.edgeInsets10,
              margin: Dimens.edgeInsetsTop10,
              decoration: BoxDecoration(
                color: ColorsValue.containerBg,
                borderRadius: BorderRadius.circular(
                  Dimens.ten,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.selectList[index].name ?? "",
                        style: Styles.appColorW60014,
                      ),
                      Dimens.boxWidth10,
                      Text(
                        controller.selectList[index].shortcut ?? "",
                        style: Styles.txtBlackColorW80012,
                      ),
                    ],
                  ),
                  if (controller.selectList[index].steps?.isNotEmpty ??
                      false) ...[
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: Dimens.edgeInsets10,
                      shrinkWrap: true,
                      itemCount: controller.selectList[index].steps?.length,
                      itemBuilder: (context, i) {
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.selectList[index].steps?[i].step ?? "",
                              style: Styles.black2E2B3060014,
                            ),
                            Dimens.boxWidth10,
                            Text(
                              controller.selectList[index].steps?[i].shortCut ??
                                  "",
                              style: Styles.black2E2B3080012,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }
}
