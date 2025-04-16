import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:illustrator_guide/app/utils/utils.dart';
import 'package:lottie/lottie.dart';

class OpenAdManager {
  AppOpenAd? _appOpenAd;
  ValueNotifier<bool?> isAdxAd = ValueNotifier<bool?>(null);
  RxBool isLoaded = false.obs;
  Timer? _retryTimer;
  // Replace with your real ad unit IDs
  static String adxOpenAdUnitId = adsIdsModel.adx?.aOpenAd ??
      '/23195226677,23207348059/illustratorguides_vedansh_appopen';
  static String admobOpenAdUnitId =
      adsIdsModel.admob?.aOpenAd ?? 'ca-app-pub-4389462255518752/7062678319';

  bool _isAppOpenAdLoaded = false;

  void createAppOpenAd({required VoidCallback onComplete}) {
    // Show loading UI
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [Lottie.asset('assets/loading.json')],
              ),
            ),
          ),
        );
      },
    );

    // Load AdX App Open Ad first
    _loadAppOpenAd(
      adUnitId: adxOpenAdUnitId, // AdX ad unit
      onLoaded: (ad) {
        _appOpenAd = ad;
        _isAppOpenAdLoaded = true;
        Get.back();
        showAppOpenAd(onComplete: onComplete);
      },
      onFailed: () {
        // Fallback to AdMob App Open Ad
        _loadAppOpenAd(
          adUnitId: admobOpenAdUnitId, // Your AdMob fallback
          onLoaded: (ad) {
            _appOpenAd = ad;
            _isAppOpenAdLoaded = true;
            Get.back();
            showAppOpenAd(onComplete: onComplete);
          },
          onFailed: () {
            Get.back();
            _isAppOpenAdLoaded = false;
            onComplete(); // Continue flow even if ad fails
          },
        );
      },
    );
  }

  void _loadAppOpenAd({
    required String adUnitId,
    required Function(AppOpenAd) onLoaded,
    required VoidCallback onFailed,
  }) {
    AppOpenAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (AppOpenAd ad) => onLoaded(ad),
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint("App Open Ad failed to load: $error");
          onFailed();
        },
      ),
      // orientation: AppOpenAd.orientationPortrait,
    );
  }

  void showAppOpenAd({required VoidCallback onComplete}) {
    if (_appOpenAd != null) {
      _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _appOpenAd = null;
          _isAppOpenAdLoaded = false;
          onComplete();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _appOpenAd = null;
          _isAppOpenAdLoaded = false;
          debugPrint("App Open Ad failed to show: $error");
          onComplete();
        },
      );
      _appOpenAd!.show();
    } else {
      debugPrint("⚠️ No App Open Ad available to show.");
      onComplete();
    }
  }
}
