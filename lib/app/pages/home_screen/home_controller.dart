import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HomeController extends GetxController {
  HomeController(this.homePresenter);

  HomePresenter homePresenter;

  @override
  onInit() {
    super.onInit();
    youtubePlayerController = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        loop: false,
        showVideoAnnotations: false,
        showFullscreenButton: true,
      ),
    );
    youtubePlayerController.cueVideoById(videoId: 'FkYfwtIPMPo');
    // youtubePlayerController.setFullScreenListener(
    //   (value) {
    //     if (value) {
    //       SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    //       SystemChrome.setPreferredOrientations([
    //         DeviceOrientation.landscapeLeft,
    //         DeviceOrientation.landscapeRight,
    //       ]);
    //     } else {
    //       // Exiting fullscreen
    //       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    //       SystemChrome.setPreferredOrientations([
    //         DeviceOrientation.portraitUp,
    //         DeviceOrientation.portraitDown,
    //       ]);
    //     }
    //   },
    // );
    youtubePlayerController.enterFullScreen();
  }

  int selectIndex = 0;

  List<String> strList = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
  ];

  /// ================================================ ToolDetailsScreen =============================================///

  late YoutubePlayerController youtubePlayerController;

  List<BasicToolObject> basicTool = [
    BasicToolObject(imagePath: 'imagePath', toolName: 'toolName'),
    BasicToolObject(imagePath: 'imagePath', toolName: 'toolName'),
    BasicToolObject(imagePath: 'imagePath', toolName: 'toolName'),
    BasicToolObject(imagePath: 'imagePath', toolName: 'toolName'),
    BasicToolObject(imagePath: 'imagePath', toolName: 'toolName'),
  ];
  List<String> testList = ["fds", "Fsdf", "Fsdf"];
  int selectPage = 0;

  Widget commonBasicTool() {
    return Padding(
      padding: Dimens.edgeInsetsTop20,
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) => Padding(
          padding: Dimens.edgeInsetsLeft10.copyWith(bottom: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("data"),
                Dimens.boxHeight10,
                const Text("data"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget commonIntro() {
    return Padding(
      padding: Dimens.edgeInsetsTop20,
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
        ),
        itemCount: 19,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300],
          ),
          child: Padding(
            padding:
                Dimens.edgeInsets10.copyWith(top: 20, bottom: 20, left: 20),
            child: Row(
              children: [
                const Icon(Icons.access_alarm),
                Dimens.boxWidth10,
                const Text(
                  "Introduction",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BasicToolObject {
  BasicToolObject({
    required this.imagePath,
    required this.toolName,
  });

  final String imagePath;
  final String toolName;
}
