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
}
