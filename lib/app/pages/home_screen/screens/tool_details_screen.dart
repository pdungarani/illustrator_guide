import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ToolDetailsScreen extends StatelessWidget {
  const ToolDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) {
        var controller = Get.find<HomeController>();
        controller.basicToolsModel = null;
        controller.basicToolsModel = Get.arguments;
        controller.youtubePlayerController
            .cueVideoById(videoId: controller.basicToolsModel?.video ?? "");
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: PreferredSize(
            preferredSize: Size(double.maxFinite, Dimens.sixty),
            child: ScreenHeader(
              onTap: () {
                Get.back();
              },
              isVisible: true,
              image: AssetConstants.back_arrow,
              width: Dimens.thirty,
              height: Dimens.thirty,
              title: controller.basicToolsModel?.name ?? "",
              txtStyle: Styles.whiteColorW70020,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: Dimens.edgeInsets20,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      Dimens.ten,
                    ),
                    child: YoutubePlayer(
                      controller: controller.youtubePlayerController,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Dimens.boxHeight10,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        controller.basicToolsModel?.toolsQuestion?.length,
                    itemBuilder: (context, index) {
                      var itemQue =
                          controller.basicToolsModel?.toolsQuestion?[index];
                      return Padding(
                        padding: Dimens.edgeInsetsTopt10,
                        child: Column(
                          children: [
                            Text(
                              itemQue?.question ?? "",
                              style: Styles.txtBlackColorW70020,
                            ),
                            Dimens.boxHeight15,
                            Text(
                              itemQue?.answer ?? "",
                              style: Styles.txtBlackColorW40014,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Dimens.boxHeight10,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.basicToolsModel?.steps?.length,
                    itemBuilder: (context, index) {
                      var itemStep = controller.basicToolsModel?.steps?[index];
                      return Padding(
                        padding: Dimens.edgeInsetsTopt10,
                        child: Text(
                          itemStep?.step ?? "",
                          style: Styles.txtBlackColorW40014,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
