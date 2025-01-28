import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';
import 'package:illustrator_guide/app/pages/shortcuts_screen/shortcuts_page.dart';

class ShortcutsScreen extends StatelessWidget {
  const ShortcutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShortcutsController>(
      builder: (controller) {
        return DefaultTabController(
          length: 6,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              title: Text(
                'Shortcuts',
                style: Styles.black50018,
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(40.0),
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.blue.shade900,
                  tabs: const [
                    Tab(text: 'Tools'),
                    Tab(text: 'File'),
                    Tab(text: 'Edit'),
                    Tab(text: 'Object'),
                    Tab(text: 'Type'),
                    Tab(text: 'Select'),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
            ),
            body: TabBarView(
              children: [
                Scaffold(
                  backgroundColor: ColorsValue.whiteColor,
                  body: const Text('Tools Content'),
                ),
                Scaffold(
                  backgroundColor: ColorsValue.whiteColor,
                  body: const Text('File Content'),
                ),
                Scaffold(
                  backgroundColor: ColorsValue.whiteColor,
                  body: const Text('Edit Content'),
                ),
                Scaffold(
                  backgroundColor: ColorsValue.whiteColor,
                  body: const Text('Object Content'),
                ),
                Scaffold(
                  backgroundColor: ColorsValue.whiteColor,
                  body: const Text('Type Content'),
                ),
                Scaffold(
                  backgroundColor: ColorsValue.whiteColor,
                  body: const Text('Select Content'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
