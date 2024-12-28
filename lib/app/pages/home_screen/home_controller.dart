import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';
import 'package:illustrator_guide/domain/domain.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HomeController extends GetxController {
  HomeController(this.homePresenter);

  HomePresenter homePresenter;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late YoutubePlayerController youtubePlayerController;
  int selectPage = 0;

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
  }

  List<String> bannerList = [
    AssetConstants.banner_align_tool,
    AssetConstants.banner_clipping_mask,
    AssetConstants.banner_join_tool,
    AssetConstants.banner_move_tool,
    AssetConstants.banner_pathfinder,
    AssetConstants.banner_pen_tool,
    AssetConstants.banner_selection_tool,
    AssetConstants.banner_shape_builder_tool,
    AssetConstants.banner_type_tool,
  ];

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

  List<BasicToolsModel> basicToolDetilsList = [
    BasicToolsModel(
      icon: AssetConstants.move_tool,
      name: 'move_tool'.tr,
      steps: [
        Steps(
          step: 'align_step1'.tr,
        ),
        Steps(
          step: 'align_step2'.tr,
        ),
        Steps(
          step: 'align_step3'.tr,
        )
      ],
      toolsQuestion: [
        ToolsQuestion(
          question: 'align_que1'.tr,
          answer: 'align_ans1'.tr,
        ),
        ToolsQuestion(
          question: 'align_que2'.tr,
          answer: 'align_ans2'.tr,
        ),
      ],
      video: 'FkYfwtIPMPo',
    ),
    BasicToolsModel(
      icon: AssetConstants.direct_selection_tool,
      name: 'selection_tool'.tr,
      steps: [
        Steps(
          step: 'align_step1'.tr,
        ),
        Steps(
          step: 'align_step2'.tr,
        ),
        Steps(
          step: 'align_step3'.tr,
        )
      ],
      toolsQuestion: [
        ToolsQuestion(
          question: 'align_que1'.tr,
          answer: 'align_ans1'.tr,
        ),
        ToolsQuestion(
          question: 'align_que2'.tr,
          answer: 'align_ans2'.tr,
        ),
      ],
      video: 'somEUTMlhKI',
    ),
    BasicToolsModel(
      icon: AssetConstants.pen_tool,
      name: 'pen_tool'.tr,
      steps: [
        Steps(
          step: 'align_step1'.tr,
        ),
        Steps(
          step: 'align_step2'.tr,
        ),
        Steps(
          step: 'align_step3'.tr,
        )
      ],
      toolsQuestion: [
        ToolsQuestion(
          question: 'align_que1'.tr,
          answer: 'align_ans1'.tr,
        ),
        ToolsQuestion(
          question: 'align_que2'.tr,
          answer: 'align_ans2'.tr,
        ),
      ],
      video: '6YNce6GSjC4',
    ),
    BasicToolsModel(
      icon: AssetConstants.join_tool,
      name: 'join_tool'.tr,
      steps: [
        Steps(
          step: 'align_step1'.tr,
        ),
        Steps(
          step: 'align_step2'.tr,
        ),
        Steps(
          step: 'align_step3'.tr,
        )
      ],
      toolsQuestion: [
        ToolsQuestion(
          question: 'align_que1'.tr,
          answer: 'align_ans1'.tr,
        ),
        ToolsQuestion(
          question: 'align_que2'.tr,
          answer: 'align_ans2'.tr,
        ),
      ],
      video: '_t-bDpf9tRw',
    ),
    BasicToolsModel(
      icon: AssetConstants.ic_align,
      name: 'align'.tr,
      steps: [
        Steps(
          step: 'align_step1'.tr,
        ),
        Steps(
          step: 'align_step2'.tr,
        ),
        Steps(
          step: 'align_step3'.tr,
        )
      ],
      toolsQuestion: [
        ToolsQuestion(
          question: 'align_que1'.tr,
          answer: 'align_ans1'.tr,
        ),
        ToolsQuestion(
          question: 'align_que2'.tr,
          answer: 'align_ans2'.tr,
        ),
      ],
      video: 'FkYfwtIPMPo',
    ),
    BasicToolsModel(
      icon: AssetConstants.pathfinder,
      name: 'pathfinder'.tr,
      steps: [
        Steps(
          step: 'align_step1'.tr,
        ),
        Steps(
          step: 'align_step2'.tr,
        ),
        Steps(
          step: 'align_step3'.tr,
        )
      ],
      toolsQuestion: [
        ToolsQuestion(
          question: 'align_que1'.tr,
          answer: 'align_ans1'.tr,
        ),
        ToolsQuestion(
          question: 'align_que2'.tr,
          answer: 'align_ans2'.tr,
        ),
      ],
      video: 'vqliIC8eID4',
    ),
    BasicToolsModel(
      icon: AssetConstants.type_tool,
      name: 'type_tool'.tr,
      steps: [
        Steps(
          step: 'align_step1'.tr,
        ),
        Steps(
          step: 'align_step2'.tr,
        ),
        Steps(
          step: 'align_step3'.tr,
        )
      ],
      toolsQuestion: [
        ToolsQuestion(
          question: 'align_que1'.tr,
          answer: 'align_ans1'.tr,
        ),
        ToolsQuestion(
          question: 'align_que2'.tr,
          answer: 'align_ans2'.tr,
        ),
      ],
      video: 'aEtlyfpV_WM',
    ),
    BasicToolsModel(
      icon: AssetConstants.ic_cliping_mask,
      name: 'clipping_mask'.tr,
      steps: [
        Steps(
          step: 'align_step1'.tr,
        ),
        Steps(
          step: 'align_step2'.tr,
        ),
        Steps(
          step: 'align_step3'.tr,
        )
      ],
      toolsQuestion: [
        ToolsQuestion(
          question: 'align_que1'.tr,
          answer: 'align_ans1'.tr,
        ),
        ToolsQuestion(
          question: 'align_que2'.tr,
          answer: 'align_ans2'.tr,
        ),
      ],
      video: 'AQ1WFyw1ve4',
    ),
    BasicToolsModel(
      icon: AssetConstants.shape_builder_tool,
      name: 'shape_builder_tool'.tr,
      steps: [
        Steps(
          step: 'align_step1'.tr,
        ),
        Steps(
          step: 'align_step2'.tr,
        ),
        Steps(
          step: 'align_step3'.tr,
        )
      ],
      toolsQuestion: [
        ToolsQuestion(
          question: 'align_que1'.tr,
          answer: 'align_ans1'.tr,
        ),
        ToolsQuestion(
          question: 'align_que2'.tr,
          answer: 'align_ans2'.tr,
        ),
      ],
      video: 'Jbq-iJFnK9g',
    ),
  ];

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////// ToolDetailsScreen //////////////////////////////////////////////////

  BasicToolsModel? basicToolsModel = BasicToolsModel();
}
