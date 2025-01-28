import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class FullVideoScreen extends StatefulWidget {
  FullVideoScreen({super.key, this.videoId});

  String? videoId;

  @override
  State<FullVideoScreen> createState() => _FullVideoScreenState();
}

class _FullVideoScreenState extends State<FullVideoScreen> {
  late YoutubePlayerController _controller;

  bool isBack = false;

  @override
  void initState() {
    super.initState();
    isBack = Get.arguments[1];
    _controller = YoutubePlayerController.fromVideoId(
      videoId: Get.arguments[0],
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );

    _controller.setFullScreenListener(
      (value) {
        enableFullscreen(!isFullscreen);
      },
    );
  }

  bool isFullscreen = true;

  void enableFullscreen(bool fullscreen) {
    setState(() {
      isFullscreen = fullscreen;
    });

    if (isBack) {
      _controller.close();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      Get.back();
    } else if (fullscreen) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      SystemChrome.setPreferredOrientations([]);
    }
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size(0, 0),
        child: Container(),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                YoutubePlayer(
                  controller: _controller,
                  backgroundColor: Colors.transparent,
                  enableFullScreenOnVerticalDrag: false,
                  aspectRatio: isFullscreen ? 16 / 7 : 16 / 9,
                ),
              ],
            ),
          ),
          Positioned(
            top: 12,
            left: 20,
            child: CircleAvatar(
              backgroundColor: ColorsValue.black2E2B30,
              child: IconButton(
                onPressed: () {
                  _controller.close();
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitUp,
                    DeviceOrientation.portraitDown,
                  ]);
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
