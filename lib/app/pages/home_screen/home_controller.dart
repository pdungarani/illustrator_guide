import 'package:carousel_slider/carousel_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flag/flag_enum.dart';
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

  String? language;

  int current = 0;
  final CarouselSliderController carouselSliderController =
      CarouselSliderController();

  FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;

  @override
  onInit() {
    super.onInit();
    networkCheck();
    language = Get.find<Repository>().getStringValue(LocalKeys.language);
    FirebaseAnalytics.instance.logScreenView(screenName: "HomeScreen");
  }

  List<BasicToolsModel> basicTfdoolDetilsList = [
    BasicToolsModel(
      icon: AssetConstants.banner_align_tool,
      name: 'shape_builder_tool'.tr,
      widget: "",
    ),
  ];

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
      bannerImage: AssetConstants.banner_move_tool,
      icon: AssetConstants.move_tool,
      name: 'move_tool'.tr,
      steps: [
        Steps(
          step: 'move_step1'.tr,
        ),
        Steps(
          step: 'move_step2'.tr,
        ),
        Steps(
          step: 'move_step3'.tr,
        )
      ],
      toolsQuestion: [
        ToolsQuestion(
          question: 'move_que1'.tr,
          answer: 'move_ans1'.tr,
        ),
        ToolsQuestion(
          question: 'move_que2'.tr,
        ),
      ],
      video: 'FkYfwtIPMPo',
    ),
    BasicToolsModel(
      bannerImage: AssetConstants.banner_selection_tool,
      icon: AssetConstants.direct_selection_tool,
      name: 'selection_tool'.tr,
      steps: [
        Steps(
          step: 'selection_step1'.tr,
        ),
        Steps(
          step: 'selection_step2'.tr,
        ),
        Steps(
          step: 'selection_step3'.tr,
        ),
        Steps(
          step: 'selection_step4'.tr,
        ),
        Steps(
          step: 'selection_step5'.tr,
        )
      ],
      toolsQuestion: [
        ToolsQuestion(
          question: 'selection_que1'.tr,
          answer: 'selection_ans1'.tr,
        ),
        ToolsQuestion(
          question: 'selection_que2'.tr,
        ),
      ],
      video: 'somEUTMlhKI',
    ),
    BasicToolsModel(
      bannerImage: AssetConstants.banner_pen_tool,
      icon: AssetConstants.pen_tool,
      name: 'pen_tool'.tr,
      steps: [
        Steps(
          step: 'pen_step1'.tr,
        ),
        Steps(
          step: 'pen_step2'.tr,
        ),
        Steps(
          step: 'pen_step3'.tr,
        ),
        Steps(
          step: 'pen_step4'.tr,
        ),
        Steps(
          step: 'pen_step5'.tr,
        ),
      ],
      toolsQuestion: [
        ToolsQuestion(
          question: 'pen_que1'.tr,
          answer: 'pen_ans1'.tr,
        ),
        ToolsQuestion(
          question: 'pen_que2'.tr,
        ),
      ],
      video: '6YNce6GSjC4',
    ),
    BasicToolsModel(
      bannerImage: AssetConstants.banner_join_tool,
      icon: AssetConstants.join_tool,
      name: 'join_tool'.tr,
      steps: [
        Steps(
          step: 'join_step1'.tr,
        ),
        Steps(
          step: 'join_step2'.tr,
        ),
        Steps(
          step: 'join_step3'.tr,
        ),
        Steps(
          step: 'join_step4'.tr,
        )
      ],
      toolsQuestion: [
        ToolsQuestion(
          question: 'join_que1'.tr,
          answer: 'join_ans1'.tr,
        ),
        ToolsQuestion(
          question: 'join_que2'.tr,
        ),
      ],
      video: '_t-bDpf9tRw',
    ),
    BasicToolsModel(
      bannerImage: AssetConstants.banner_align_tool,
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
      bannerImage: AssetConstants.banner_pathfinder,
      icon: AssetConstants.pathfinder,
      name: 'pathfinder'.tr,
      steps: [
        Steps(
          step: 'pathfinder_step1'.tr,
        ),
        Steps(
          step: 'pathfinder_step2'.tr,
        ),
        Steps(
          step: 'pathfinder_step3'.tr,
        ),
        Steps(
          step: 'pathfinder_step4'.tr,
        ),
        Steps(
          step: 'pathfinder_step5'.tr,
        ),
        Steps(
          step: 'pathfinder_step6'.tr,
        ),
        Steps(
          step: 'pathfinder_step7'.tr,
        ),
      ],
      toolsQuestion: [
        ToolsQuestion(
          question: 'pathfinder_que1'.tr,
          answer: 'pathfinder_ans1'.tr,
        ),
        ToolsQuestion(
          question: 'pathfinder_que2'.tr,
        ),
      ],
      video: 'vqliIC8eID4',
    ),
    BasicToolsModel(
      bannerImage: AssetConstants.banner_type_tool,
      icon: AssetConstants.type_tool,
      name: 'type_tool'.tr,
      steps: [
        Steps(
          step: 'type_step1'.tr,
        ),
        Steps(
          step: 'type_step2'.tr,
        ),
        Steps(
          step: 'type_step3'.tr,
        ),
        Steps(
          step: 'type_step4'.tr,
        ),
        Steps(
          step: 'type_step5'.tr,
        ),
      ],
      toolsQuestion: [
        ToolsQuestion(
          question: 'type_que1'.tr,
          answer: 'type_ans1'.tr,
        ),
        ToolsQuestion(
          question: 'type_que2'.tr,
        ),
      ],
      video: 'aEtlyfpV_WM',
    ),
    BasicToolsModel(
      bannerImage: AssetConstants.banner_clipping_mask,
      icon: AssetConstants.ic_cliping_mask,
      name: 'clipping_mask'.tr,
      steps: [
        Steps(
          step: 'clipping_step1'.tr,
        ),
        Steps(
          step: 'clipping_step2'.tr,
        ),
        Steps(
          step: 'clipping_step3'.tr,
        ),
        Steps(
          step: 'clipping_step4'.tr,
        )
      ],
      toolsQuestion: [
        ToolsQuestion(
          question: 'clipping_que1'.tr,
          answer: 'clipping_ans1'.tr,
        ),
        ToolsQuestion(
          question: 'clipping_que2'.tr,
        ),
      ],
      video: 'AQ1WFyw1ve4',
    ),
    BasicToolsModel(
      bannerImage: AssetConstants.banner_shape_builder_tool,
      icon: AssetConstants.shape_builder_tool,
      name: 'shape_builder_tool'.tr,
      steps: [
        Steps(
          step: 'shape_step1'.tr,
        ),
        Steps(
          step: 'shape_step2'.tr,
        ),
        Steps(
          step: 'shape_step3'.tr,
        ),
        Steps(
          step: 'shape_step4'.tr,
        ),
        Steps(
          step: 'shape_step5'.tr,
        ),
      ],
      toolsQuestion: [
        ToolsQuestion(
          question: 'shape_que1'.tr,
          answer: 'shape_ans1'.tr,
        ),
        ToolsQuestion(
          question: 'shape_que2'.tr,
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

  String status = 'Offline';

  networkCheck() async {
    var subscription = await (Connectivity().checkConnectivity());
    {
      if (subscription.contains(ConnectivityResult.none)) {
        status = "Offline";
      } else {
        status = "Online";
      }
      update();
    }
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////// LanguageScreen //////////////////////////////////////////////////

  List<BasicToolsModel> languageList = [
    BasicToolsModel(
      name: 'India - Gujarati',
      flagProperty: FlagsCode.IN,
      widget: ('gu'),
      Value: false,
    ),
    BasicToolsModel(
      name: 'India - English',
      flagProperty: FlagsCode.IN,
      widget: ('en'),
      Value: true,
    ),
    BasicToolsModel(
      name: 'India - Hindi',
      flagProperty: FlagsCode.IN,
      widget: ('hi'),
      Value: false,
    ),
    BasicToolsModel(
      name: 'Germany - German',
      flagProperty: FlagsCode.DE,
      widget: ('ge'),
      Value: false,
    ),
  ];

  updateLanguage(Locale locale) {
    Utility.selectedDrawerIndex = 0;
    RouteManagement.goToHomeScreen();
    Get.updateLocale(locale);
  }

  Future<void> setUpdatelanguage(value) async {
    Get.find<Repository>().saveValue(LocalKeys.language, value);
  }
}
