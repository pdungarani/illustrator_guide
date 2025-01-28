import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            showVideoAnnotations: false,
            showFullscreenButton: true,
            loop: false,
          ),
        );
        controller.youtubePlayerController.cueVideoById(
          videoId: controller.basicToolsModel?.video ?? "",
        );
        controller.youtubePlayerController.setFullScreenListener(
          (value) {},
        );
        controller.youtubePlayerController.setFullScreenListener(
          (value) {
            RouteManagement.goTofullScreen(
              controller.basicToolsModel?.video ?? "",
              false,
            );
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeRight,
            ]);
          },
        );
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(controller.basicToolsModel?.bannerImage ?? ''),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 50),
                      child: CircleAvatar(
                        backgroundColor: ColorsValue.black2E2B30,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.basicToolsModel?.toolsQuestion?.length,
                  itemBuilder: (context, index) {
                    var itemQue =
                        controller.basicToolsModel?.toolsQuestion?[index];
                    return Column(
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
                          Dimens.boxHeight10,
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[200],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: YoutubePlayer(
                                controller: controller.youtubePlayerController,
                                backgroundColor: Colors.transparent,
                                enableFullScreenOnVerticalDrag: false,
                              ),
                            ),
                          ),
                          Dimens.boxHeight10,
                        ],
                      ],
                    );
                  },
                ),
                ListView.builder(
                  padding: const EdgeInsets.all(16.0).copyWith(top: 8),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.basicToolsModel?.steps?.length,
                  itemBuilder: (context, index) {
                    var itemStep = controller.basicToolsModel?.steps?[index];
                    return Text(
                      itemStep?.step ?? "",
                      style: Styles.txtBlackColorW40014,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
