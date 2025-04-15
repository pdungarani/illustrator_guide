import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:illustrator_guide/app/app.dart';
RxBool isLoaded = false.obs;
class BannerAdManager {
  BannerAd? _bannerAd;
  ValueNotifier<bool?> isAdxAd = ValueNotifier<bool?>(null);
  final int retryDelayInSeconds = adsIdsModel.adx?.isShow ?? 60; // Retry after 30 seconds
  Timer? _retryTimer;

  static String adxBannerAdUnitId = adsIdsModel.adx?.bannerAd ??
      '/23195226677,23207348059/illustratorguides_vedansh_banner';
  static String admobBannerAdUnitId =
      adsIdsModel.admob?.bannerAd ?? 'ca-app-pub-4389462255518752/2608427982 ';

  BannerAd? get bannerAd => _bannerAd;
  bool get isAdAvailable => isLoaded.value;

  void preloadBannerAd({AdSize adSize = AdSize.leaderboard}) {
    _retryTimer?.cancel(); // Cancel previous retry if running

    _loadAdxBannerAd(
      adSize: adSize,
      onSuccess: () {
       // Utility.snacBar('✅ ADX banner ad preloaded', Colors.green);
        debugPrint("✅ ADX banner ad preloaded.");
      },
      onFailure: () {
        _loadAdmobBannerAd(
          adSize: adSize,
          onSuccess: () {
         //   Utility.snacBar('✅ AdMob banner ad preloaded', Colors.green);
            debugPrint("✅ AdMob banner ad preloaded.");
          },
          onFailure: () {
            isLoaded.value = false;
            isAdxAd.value = null;
          //  Utility.snacBar('❌ Failed to preload both ADX and AdMob banner ads.', Colors.red);
            debugPrint("❌ Failed to preload both ADX and AdMob banner ads.");
            _scheduleRetry(adSize);
          },
        );
      },
    );
  }

  void _scheduleRetry(AdSize adSize) {
    debugPrint("🔄 Retrying banner ad preload in $retryDelayInSeconds seconds...");
    _retryTimer = Timer(Duration(seconds: retryDelayInSeconds), () {
      preloadBannerAd(adSize: adSize); // Retry
    });
  }

  void _loadAdxBannerAd({
    required AdSize adSize,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) {
    final ad = BannerAd(
      adUnitId: adxBannerAdUnitId,
      size: adSize,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          _bannerAd = ad as BannerAd;
          isLoaded.value = true;
          isAdxAd.value = true;
          onSuccess();
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          debugPrint("❌ ADX banner ad failed: $error");
          ad.dispose();
          isLoaded.value = false;
          onFailure();
        },
      ),
    );
    ad.load();
  }

  void _loadAdmobBannerAd({
    required AdSize adSize,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) {
    final ad = BannerAd(
      adUnitId: admobBannerAdUnitId,
      size: adSize,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          _bannerAd = ad as BannerAd;
          isLoaded.value = true;
          isAdxAd.value = false;
          onSuccess();
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          debugPrint("❌ AdMob banner ad failed: $error");
          ad.dispose();
          isLoaded.value = false;
          onFailure();
        },
      ),
    );
    ad.load();
  }

  void dispose() {
    _retryTimer?.cancel(); // Cancel retry timer on dispose
    _bannerAd?.dispose();
    _bannerAd = null;
    isLoaded.value = false;
  }
}

