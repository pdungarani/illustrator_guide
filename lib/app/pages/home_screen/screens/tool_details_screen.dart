import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ToolDetailsScreen extends StatelessWidget {
  const ToolDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBar(
            title: Text(
              'Tool',
              style: Styles.whiteColorW70020,
            ),
            centerTitle: true,
          ),
          body: ListView(
            padding: Dimens.edgeInsets20,
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
              Text(
                "Introduction to Align Tool",
                style: Styles.txtBlackColorW70020,
              ),
              Dimens.boxHeight10,
              Text(
                "The *Align Tool* in Adobe Illustrator allows you to align and distribute objects relative to each other, to an artboard, or to a key object. It provides options to align objects horizontally, vertically, or distribute them evenly. The tool ensures precision in layout and design, saving time while organizing objects. Accessible via the *Align panel* (Window > Align) or the control bar.",
                style: Styles.txtBlackColorW40014,
              ),
              Dimens.boxHeight10,
              Text(
                "How to use Align Tool?",
                style: Styles.txtBlackColorW70020,
              ),
              Dimens.boxHeight10,
              Text(
                "In Illustrator, access the align panel by clicking Window > Align (Shift + F7). In Design, access the align panel by clicking Window > Object & Layout > Align (Shift + F7). Tip: Drag the align panel to your windows panel to give you easy access to the alignment panel.",
                style: Styles.txtBlackColorW40014,
              ),
              Dimens.boxHeight20,
              Text(
                "1.Select the objects to align or distribute.",
                style: Styles.txtBlackColorW40014,
              ),
              Dimens.boxHeight10,
              Text(
                "2.Using the Selection tool, Shift-click on the artboard you want to use to activate it.",
                style: Styles.txtBlackColorW40014,
              ),
              Dimens.boxHeight10,
              Text(
                "3.In the Align or Control panel, select Align To Artboard, then click the button for the type of alignment or distribution you want.",
                style: Styles.txtBlackColorW40014,
              )
            ],
          ),
        );
      },
    );
  }
}
