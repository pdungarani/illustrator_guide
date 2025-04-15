import 'package:illustrator_guide/ads/bannerAds_show.dart';
import 'package:illustrator_guide/ads/interstritial_ad.dart';
import 'package:illustrator_guide/ads/openAdsManagerLifecycle.dart';
import 'package:illustrator_guide/ads/open_ad.dart';
import 'package:illustrator_guide/ads/reward_ad.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdsController extends GetxController with WidgetsBindingObserver {
  OpenAdManager openAdManager = OpenAdManager();
  late AppLifecycleReactor appLifecycleReactor;
  final adManager = AdManager();
  final BannerAdManager bannerAdManager = BannerAdManager();
  final RewardAdManager rewardedAdManager = RewardAdManager();
  RxBool isLoaded = false.obs;

  @override
  void onInit() {
    print('-----------call------------adsController');
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    appLifecycleReactor = AppLifecycleReactor();
    appLifecycleReactor.listenToAppStateChanges();
    openAdManager.preloadOpenAd();
    bannerAdManager.preloadBannerAd();
    adManager.initAdLoad();
    rewardedAdManager.initAdLoad();
    // Future.delayed(Duration(seconds: 5), () {
    //   openAdManager.showAdIfAvailable();
    // });
  }

  void onAdTrigger() {
    adManager.showAdIfAvailable();
  }

  void onRewardAdTrigger() {
    rewardedAdManager.showAdIfAvailable(
      onRewardEarned: () {},
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    openAdManager.dispose();
    bannerAdManager.dispose();
    adManager.dispose();
    rewardedAdManager.dispose();
    super.dispose();
  }
}
