import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';
import 'package:illustrator_guide/app/pages/shortcuts_screen/shortcuts_pages.dart';

class ObjectScreen extends StatelessWidget {
  const ObjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShortcutsController>(
      builder: (controller) {
        return ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          padding: Dimens.edgeInsets20,
          itemCount: controller.objectList.length,
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
                        controller.objectList[index].name ?? "",
                        style: Styles.appColorW60014,
                      ),
                      Dimens.boxWidth10,
                      Text(
                        controller.objectList[index].shortcut ?? "",
                        style: Styles.txtBlackColorW80012,
                      ),
                    ],
                  ),
                  if (controller.objectList[index].steps?.isNotEmpty ??
                      false) ...[
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: Dimens.edgeInsets10,
                      shrinkWrap: true,
                      itemCount: controller.objectList[index].steps?.length,
                      itemBuilder: (context, i) {
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.objectList[index].steps?[i].step ?? "",
                              style: Styles.black2E2B3060014,
                            ),
                            Dimens.boxWidth10,
                            Text(
                              controller.objectList[index].steps?[i].shortCut ??
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
