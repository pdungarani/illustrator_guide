import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:illustrator_guide/ads%20copy/bannerAds_show.dart';
import 'package:illustrator_guide/ads%20copy/interstritial_ad.dart';
import 'package:illustrator_guide/ads%20copy/openAdsManagerLifecycle.dart';
import 'package:illustrator_guide/ads%20copy/open_ad.dart';
import 'package:illustrator_guide/ads%20copy/reward_ad.dart';

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

    // openAdManager.preloadOpenAd();
    bannerAdManager.preloadBannerAd();
    //adManager.initAdLoad();
    // rewardedAdManager.initAdLoad();
    // Future.delayed(Duration(seconds: 5), () {
    //   openAdManager.showAdIfAvailable();
    // });
  }

  void onAdTrigger(
      {required VoidCallback onComplete, bool isAfterAds = false}) {
    adManager.createInterstitialAd(onComplete: onComplete);
  }

  void onRewardAdTrigger(
      {required VoidCallback onComplete, bool isAfterAds = false}) {
    rewardedAdManager.createRewardAd(onComplete: onComplete);
  }

  @override
  void onReady() {
    super.onReady();
    openAdManager.createAppOpenAd(
      onComplete: () {},
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    //  openAdManager.dispose();
    bannerAdManager.dispose();
    //  adManager.dispose();
    //  rewardedAdManager.dispose();
    super.dispose();
  }
}
