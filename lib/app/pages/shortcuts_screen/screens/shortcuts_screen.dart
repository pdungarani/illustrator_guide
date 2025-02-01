import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';
import 'package:illustrator_guide/app/pages/shortcuts_screen/shortcuts_pages.dart';

class ShortcutsScreen extends StatelessWidget {
  const ShortcutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShortcutsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBar(
            backgroundColor: ColorsValue.appColor,
            leading: Padding(
              padding: Dimens.edgeInsets8,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: ColorsValue.whiteColor,
                ),
              ),
            ),
            title: Text(
              "shortcuts".tr,
              style: Styles.whiteColorW70020,
            ),
            bottom: TabBar(
              controller: controller.tabController,
              labelStyle: Styles.whiteColorW70016,
              tabAlignment: TabAlignment.start,
              unselectedLabelColor: ColorsValue.textGreyColor,
              indicatorColor: ColorsValue.whiteColor,
              labelColor: ColorsValue.whiteColor,
              isScrollable: true,
              dividerColor: ColorsValue.whiteColor,
              tabs: [
                Tab(
                  text: 'tool'.tr,
                ),
                Tab(
                  text: 'file'.tr,
                ),
                Tab(
                  text: 'edit'.tr,
                ),
                Tab(
                  text: 'object'.tr,
                ),
                Tab(
                  text: 'type'.tr,
                ),
                Tab(
                  text: 'select'.tr,
                ),
                Tab(
                  text: 'effect'.tr,
                ),
                Tab(
                  text: 'view'.tr,
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: controller.tabController,
            children: const [
              ToolScreen(),
              FileScreen(),
              EditScreen(),
              ObjectScreen(),
              TypeScreen(),
              SelectScreen(),
              EffectScreen(),
              ViewScreen(),
            ],
          ),
        );
      },
    );
  }
}
