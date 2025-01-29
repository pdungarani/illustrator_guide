import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';
import 'package:illustrator_guide/app/pages/shortcuts_screen/shortcuts_pages.dart';

class TypeScreen extends StatelessWidget {
  const TypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShortcutsController>(
      builder: (controller) {
        return Padding(
          padding: Dimens.edgeInsets16,
          child: ListView.builder(
            itemCount: controller.shortcuts.length,
            itemBuilder: (context, index) {
              final section = controller.shortcuts[index];
              return buildShortcutSection(
                section.title ?? '',
                section.shortCuts,
              );
            },
          ),
        );
      },
    );
  }

  Widget buildShortcutSection(String title, List<TypeQuestion>? shortcuts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Padding(
            padding: Dimens.edgeInsets0_8_0_8,
            child: Text(
              title,
              style: Styles.txtBlackColorW60014.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        Container(
          padding: Dimens.edgeInsets10,
          margin: title.isEmpty ? Dimens.edgeInsetsTop10 : Dimens.edgeInsets0,
          decoration: BoxDecoration(
            color: ColorsValue.containerBg,
            borderRadius: BorderRadius.circular(
              Dimens.ten,
            ),
          ),
          child: Wrap(
            children: shortcuts!.asMap().entries.map(
              (e) {
                final shortcut = e.value;
                return Padding(
                  padding: Dimens.edgeInsets0_4_0_4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        shortcut.question ?? '',
                        style: Styles.appColorW60014,
                      ),
                      Text(
                        shortcut.answer ?? '',
                        style: Styles.txtBlackColorW80012,
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
