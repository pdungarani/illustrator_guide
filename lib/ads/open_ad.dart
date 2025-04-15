import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:illustrator_guide/app/app.dart';

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

  //bool get isAdAvailable => _isLoade.va;
  void _retryLater() {
    _retryTimer?.cancel(); // avoid double retries
    _retryTimer = Timer(Duration(seconds: 60), () {
      debugPrint("🔁 Retrying preloadAd after failure...");
     preloadOpenAd();
    });
  }

  /// Call this as early as possible (like in splash screen or main.dart)
   preloadOpenAd() {
    _loadAdxOpenAd(
      onSuccess: () {
 //  Utility.snacBar('✅ Adx open ad preloaded', Colors.green);
      },
      onFailure: () {
        _loadAdmobOpenAd(
          onSuccess: () {
          //  Utility.snacBar('✅ AdMob open ad preloaded', Colors.green);
          },
          onFailure: () {
          //  _retryLater();
            isAdxAd.value = null;
          //  Utility.snacBar('❌ Failed to preload both ADX and AdMob App Open Ads.', Colors.red);
            debugPrint("❌ Failed to preload both ADX and AdMob App Open Ads.");
          },
        );
      },
    );
  }

  void showAdIfAvailable() {
    if (_appOpenAd != null) {
      print("++++++......>>>>>");
      _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _appOpenAd = null;
          isLoaded.value = false;
        //  preloadOpenAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _appOpenAd = null;
          isLoaded.value = false;
        //  preloadOpenAd(); // Preload again
          debugPrint("App Open Ad failed to show: $error");
        },
      );
      _appOpenAd!.show();
    } else {
      preloadOpenAd(); // Preload again
      debugPrint("⚠️ No App Open Ad available to show.");
    }
  }

  void _loadAdxOpenAd(
      {required VoidCallback onSuccess, required VoidCallback onFailure}) {
    AppOpenAd.load(
      adUnitId: adxOpenAdUnitId,
      request:  AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenAd = ad;
          isAdxAd.value = true;
          isLoaded.value = true;
          showAdIfAvailable();
          onSuccess();
        },
        onAdFailedToLoad: (error) {
          debugPrint("ADX App Open Ad failed: $error");
          isLoaded.value = false;
          onFailure();
        },
      ),
      // orientation: AppOpenAd.orientationPortrait,
    );
  }

  void _loadAdmobOpenAd(
      {required VoidCallback onSuccess, required VoidCallback onFailure}) {
    AppOpenAd.load(
      adUnitId: admobOpenAdUnitId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenAd = ad;
          isAdxAd.value = false;
          isLoaded.value = true;
          showAdIfAvailable();
          onSuccess();
        },
        onAdFailedToLoad: (error) {
          debugPrint("AdMob App Open Ad failed: $error");
          isLoaded.value = false;
          onFailure();
        },
      ),
      // orientation: AppOpenAd.orientationPortrait,
    );
  }

  void dispose() {
    _appOpenAd?.dispose();
    _appOpenAd = null;
    isLoaded.value = false;
  }
}
