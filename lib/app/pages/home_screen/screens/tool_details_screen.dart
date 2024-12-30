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
        controller.networkCheck();
        controller.basicToolsModel = null;
        controller.basicToolsModel = Get.arguments;
        controller.youtubePlayerController = YoutubePlayerController(
          params: const YoutubePlayerParams(
            showControls: true,
            mute: false,
            loop: false,
            showVideoAnnotations: false,
            showFullscreenButton: true,
          ),
        );
        controller.youtubePlayerController.cueVideoById(
          videoId: controller.basicToolsModel?.video ?? "",
        );
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
                  if (controller.basicToolsModel?.video != null) ...[
                    controller.status == "Online"
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(
                              Dimens.ten,
                            ),
                            child: YoutubePlayer(
                              controller: controller.youtubePlayerController,
                              backgroundColor: Colors.transparent,
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            width: double.maxFinite,
                            height: Dimens.hundredFifty,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimens.fifteen,
                              ),
                              color: ColorsValue.appColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'No Internet Connection found.',
                                  style: Styles.whiteColorW60016,
                                ),
                                Text(
                                  'Check your connection or try again.',
                                  style: Styles.whiteColorW60016,
                                ),
                              ],
                            ),
                          ),
                  ],
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              itemQue?.question?.trim() ?? "",
                              style: Styles.txtBlackColorW70020,
                            ),
                            if (itemQue?.answer?.isNotEmpty ?? false) ...[
                              Dimens.boxHeight15,
                              Text(
                                itemQue?.answer ?? "",
                                style: Styles.txtBlackColorW40014,
                              ),
                            ],
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
