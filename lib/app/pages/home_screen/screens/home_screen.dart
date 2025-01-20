import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/app/app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final greetingMessage = Utility.getGreetingMessage();
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            padding: Dimens.edgeInsets20.copyWith(top: 50),
            physics: const ClampingScrollPhysics(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello, $greetingMessage",
                          style: Styles.txtBlackColorW70024),
                      Dimens.boxHeight5,
                      Text("your_gateway_to_life".tr,
                          style: Styles.txtBlackColorW40012),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      RouteManagement.goToSettingScreen();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(500),
                      ),
                      child: const Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              Dimens.boxHeight20,
              SizedBox(
                height: 260,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: AssetImage(
                                  AssetConstants.aiIntroImage,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: 260,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            height: double.maxFinite,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(200),
                                  ),
                                  child: const Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("introduction".tr,
                                        style: Styles.appColorW70020),
                                    Text("let's_try_it_now".tr,
                                        style: Styles.whiteColorW60014),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(
                                      image:
                                          AssetImage(AssetConstants.toolsImage),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: double.maxFinite,
                                  width: double.maxFinite,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  height: double.maxFinite,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.7),
                                          borderRadius:
                                              BorderRadius.circular(200),
                                        ),
                                        child: const Icon(
                                          Icons.person,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "new_tools".tr,
                                          overflow: TextOverflow.ellipsis,
                                          style: Styles.whiteColorW70018,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Dimens.boxHeight10,
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          AssetConstants.shortcutsImage),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: double.maxFinite,
                                  width: double.maxFinite,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  height: double.maxFinite,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.7),
                                          borderRadius:
                                              BorderRadius.circular(200),
                                        ),
                                        child: const Icon(
                                          Icons.person,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "shortcuts".tr,
                                          style: Styles.whiteColorW70018,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Dimens.boxHeight20,
              Text(
                "basic_tools".tr,
                style: Styles.txtBlackColorW70016,
              ),
              Dimens.boxHeight10,
              GridView.builder(
                itemCount: controller.basicToolDetilsList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: Dimens.eight,
                  mainAxisSpacing: Dimens.eight,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    controller.firebaseAnalytics.logEvent(
                      name: 'home_screen',
                      parameters: {
                        'page_name':
                            controller.basicToolDetilsList[index].name ?? "",
                      },
                    ).then(
                      (value) {
                        print("Event Fire Successfully===>");
                      },
                    ).onError(
                      (error, stackTrace) {
                        print("Error===>${error.toString()}");
                      },
                    );
                    RouteManagement.goToolDetailsScreen(
                        controller.basicToolDetilsList[index]);
                  },
                  child: Container(
                    padding: Dimens.edgeInsets5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        Dimens.eight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.3),
                          blurRadius: 5.0,
                          offset: const Offset(0.0, 3.0),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          controller.basicToolDetilsList[index].icon ?? "",
                          height: Dimens.thirty,
                          width: Dimens.thirty,
                        ),
                        Dimens.boxHeight10,
                        Text(
                          controller.basicToolDetilsList[index].name ?? "",
                          style: Styles.txtBlackColorW70012,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    // return GetBuilder<HomeController>(
    //   initState: (state) {
    //     var controller = Get.find<HomeController>();
    //   },
    //   builder: (controller) {
    //     return Scaffold(
    //       key: controller.scaffoldKey,
    //       backgroundColor: ColorsValue.appBg,
    //       drawer: const AppDrower(),
    //       appBar: PreferredSize(
    //         preferredSize: Size(double.maxFinite, Dimens.sixty),
    //         child: ScreenHeader(
    //           isVisible: true,
    //           onTap: () {
    //             if (controller.scaffoldKey.currentState!.isDrawerOpen) {
    //               controller.scaffoldKey.currentState!.openEndDrawer();
    //             } else {
    //               controller.scaffoldKey.currentState!.openDrawer();
    //             }
    //           },
    //           image: AssetConstants.headerIcon,
    //           width: Dimens.thirty,
    //           height: Dimens.thirty,
    //           title: "home".tr,
    //           txtStyle: Styles.whiteColorW70020,
    //         ),
    //       ),
    //       body: Padding(
    //         padding: Dimens.edgeInsets20,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             // SizedBox(
    //             //   height: 260,
    //             //   child: Row(
    //             //     children: [
    //             //       Expanded(
    //             //         child: Container(
    //             //           padding: const EdgeInsets.all(15),
    //             //           height: double.maxFinite,
    //             //           width: double.maxFinite,
    //             //           decoration: BoxDecoration(
    //             //             color: Colors.blue,
    //             //             borderRadius: BorderRadius.circular(20),
    //             //           ),
    //             //           child: Column(
    //             //             crossAxisAlignment: CrossAxisAlignment.start,
    //             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             //             children: [
    //             //               Container(
    //             //                 height: 50,
    //             //                 width: 50,
    //             //                 alignment: Alignment.center,
    //             //                 decoration: BoxDecoration(
    //             //                   color: Colors.white.withOpacity(0.7),
    //             //                   borderRadius: BorderRadius.circular(200),
    //             //                 ),
    //             //                 child: const Icon(
    //             //                   Icons.person,
    //             //                   color: Colors.black,
    //             //                 ),
    //             //               ),
    //             //               const Column(
    //             //                 crossAxisAlignment: CrossAxisAlignment.start,
    //             //                 children: [
    //             //                   Text(
    //             //                     "Introduction",
    //             //                     style: TextStyle(
    //             //                       fontSize: 20,
    //             //                       color: CupertinoColors.white,
    //             //                       fontWeight: FontWeight.bold,
    //             //                     ),
    //             //                   ),
    //             //                   Text(
    //             //                     "Let's try it now",
    //             //                     style: TextStyle(
    //             //                       fontSize: 16,
    //             //                       color: CupertinoColors.white,
    //             //                       fontWeight: FontWeight.w400,
    //             //                     ),
    //             //                   )
    //             //                 ],
    //             //               )
    //             //             ],
    //             //           ),
    //             //         ),
    //             //       ),
    //             //       const SizedBox(
    //             //         width: 10,
    //             //       ),
    //             //       Expanded(
    //             //         child: Column(
    //             //           children: [
    //             //             Expanded(
    //             //               child: Container(
    //             //                 padding: const EdgeInsets.all(15),
    //             //                 height: double.maxFinite,
    //             //                 width: double.maxFinite,
    //             //                 decoration: BoxDecoration(
    //             //                   color: Colors.blue,
    //             //                   borderRadius: BorderRadius.circular(20),
    //             //                 ),
    //             //                 child: Column(
    //             //                   crossAxisAlignment: CrossAxisAlignment.start,
    //             //                   mainAxisAlignment:
    //             //                       MainAxisAlignment.spaceBetween,
    //             //                   children: [
    //             //                     Container(
    //             //                       height: 50,
    //             //                       width: 50,
    //             //                       alignment: Alignment.center,
    //             //                       decoration: BoxDecoration(
    //             //                         color: Colors.white.withOpacity(0.7),
    //             //                         borderRadius:
    //             //                             BorderRadius.circular(200),
    //             //                       ),
    //             //                       child: const Icon(
    //             //                         Icons.person,
    //             //                         color: Colors.black,
    //             //                       ),
    //             //                     ),
    //             //                     const Text(
    //             //                       "New Tools",
    //             //                       style: TextStyle(
    //             //                         fontSize: 18,
    //             //                         color: CupertinoColors.white,
    //             //                         fontWeight: FontWeight.bold,
    //             //                       ),
    //             //                     ),
    //             //                   ],
    //             //                 ),
    //             //               ),
    //             //             ),
    //             //             const SizedBox(
    //             //               height: 10,
    //             //             ),
    //             //             Expanded(
    //             //               child: Container(
    //             //                 padding: const EdgeInsets.all(15),
    //             //                 height: double.maxFinite,
    //             //                 width: double.maxFinite,
    //             //                 decoration: BoxDecoration(
    //             //                   color: Colors.blue,
    //             //                   borderRadius: BorderRadius.circular(20),
    //             //                 ),
    //             //                 child: Column(
    //             //                   crossAxisAlignment: CrossAxisAlignment.start,
    //             //                   mainAxisAlignment:
    //             //                       MainAxisAlignment.spaceBetween,
    //             //                   children: [
    //             //                     Container(
    //             //                       height: 50,
    //             //                       width: 50,
    //             //                       alignment: Alignment.center,
    //             //                       decoration: BoxDecoration(
    //             //                         color: Colors.white.withOpacity(0.7),
    //             //                         borderRadius:
    //             //                             BorderRadius.circular(200),
    //             //                       ),
    //             //                       child: const Icon(
    //             //                         Icons.person,
    //             //                         color: Colors.black,
    //             //                       ),
    //             //                     ),
    //             //                     const Text(
    //             //                       "Shortcuts",
    //             //                       style: TextStyle(
    //             //                         fontSize: 18,
    //             //                         color: CupertinoColors.white,
    //             //                         fontWeight: FontWeight.bold,
    //             //                       ),
    //             //                     ),
    //             //                   ],
    //             //                 ),
    //             //               ),
    //             //             ),
    //             //           ],
    //             //         ),
    //             //       )
    //             //     ],
    //             //   ),
    //             // ),
    //             Dimens.boxHeight10,
    //             CarouselSlider(
    //               items: controller.bannerList.asMap().entries.map(
    //                 (e) {
    //                   var index = e.key;
    //                   return InkWell(
    //                     onTap: () {},
    //                     child: Container(
    //                       height: Dimens.twoHundred,
    //                       decoration: BoxDecoration(
    //                         color: index == 1
    //                             ? ColorsValue.appColor
    //                             : ColorsValue.blue94A3B8,
    //                         borderRadius: BorderRadius.circular(
    //                           Dimens.twenty,
    //                         ),
    //                       ),
    //                       child: ClipRRect(
    //                         borderRadius: BorderRadius.circular(
    //                           Dimens.twenty,
    //                         ),
    //                         child: Image.asset(
    //                           e.value,
    //                           fit: BoxFit.cover,
    //                         ),
    //                       ),
    //                     ),
    //                   );
    //                 },
    //               ).toList(),
    //               carouselController: controller.carouselSliderController,
    //               options: CarouselOptions(
    //                 enlargeCenterPage: true,
    //                 autoPlay: true,
    //                 aspectRatio: 2.0,
    //                 onPageChanged: (index, reason) {
    //                   controller.current = index;
    //                   controller.update();
    //                 },
    //               ),
    //             ),
    //             Dimens.boxHeight10,
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: controller.bannerList.asMap().entries.map(
    //                 (entry) {
    //                   return InkWell(
    //                     onTap: () {
    //                       controller.carouselSliderController
    //                           .animateToPage(entry.key);
    //                     },
    //                     child: Padding(
    //                       padding: Dimens.edgeInsetsLeft2,
    //                       child: Container(
    //                         width: Dimens.six,
    //                         height: Dimens.six,
    //                         decoration: BoxDecoration(
    //                           color: controller.current == entry.key
    //                               ? ColorsValue.appColor
    //                               : ColorsValue.blue94A3B8,
    //                           borderRadius: BorderRadius.circular(
    //                             Dimens.hundred,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   );
    //                 },
    //               ).toList(),
    //             ),
    //             Dimens.boxHeight30,
    //             Expanded(
    //               child: GridView.builder(
    //                 itemCount: controller.basicToolDetilsList.length,
    //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                   crossAxisCount: 3,
    //                   crossAxisSpacing: Dimens.eight,
    //                   mainAxisSpacing: Dimens.eight,
    //                 ),
    //                 itemBuilder: (context, index) => GestureDetector(
    //                   onTap: () {
    //                     controller.firebaseAnalytics.logEvent(
    //                       name: 'home_screen',
    //                       parameters: {
    //                         'page_name':
    //                             controller.basicToolDetilsList[index].name ??
    //                                 "",
    //                       },
    //                     ).then(
    //                       (value) {
    //                         print("Event Fire Successfully===>");
    //                       },
    //                     ).onError(
    //                       (error, stackTrace) {
    //                         print("Error===>${error.toString()}");
    //                       },
    //                     );
    //                     RouteManagement.goToolDetailsScreen(
    //                         controller.basicToolDetilsList[index]);
    //                   },
    //                   child: Container(
    //                     padding: Dimens.edgeInsets5,
    //                     decoration: BoxDecoration(
    //                       color: Colors.white,
    //                       borderRadius: BorderRadius.circular(
    //                         Dimens.eight,
    //                       ),
    //                       boxShadow: [
    //                         BoxShadow(
    //                           color: Colors.black12.withOpacity(0.3),
    //                           blurRadius: 5.0,
    //                           offset: const Offset(0.0, 3.0),
    //                         ),
    //                       ],
    //                     ),
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       crossAxisAlignment: CrossAxisAlignment.center,
    //                       children: [
    //                         SvgPicture.asset(
    //                           controller.basicToolDetilsList[index].icon ?? "",
    //                           height: Dimens.thirty,
    //                           width: Dimens.thirty,
    //                         ),
    //                         Dimens.boxHeight10,
    //                         Text(
    //                           controller.basicToolDetilsList[index].name ?? "",
    //                           style: Styles.txtBlackColorW70012,
    //                           textAlign: TextAlign.center,
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}
