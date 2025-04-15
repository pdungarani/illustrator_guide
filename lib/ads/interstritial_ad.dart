import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:illustrator_guide/app/app.dart';

// class AdManager {
//   InterstitialAd? _interstitialAd;
//   bool isAdxAd = true;
//   Timer? _delayedLoadTimer;
//
//   DateTime _lastAdShown = DateTime.now().subtract(Duration(seconds: 60));
//   final int cooldownSeconds = adsIdsModel.adx?.isShow ?? 60;
//
//   static String adxAdUnitId = adsIdsModel.adx?.intertitialAd ??
//       '/23195226677,23207348059/biodatamarker_vedansh_interstital';
//   static String admobAdUnitId = adsIdsModel.admob?.intertitialAd ??
//       'ca-app-pub-4389462255518752/7860754660';
//
//   bool get isAdAvailable => _interstitialAd != null;
//
//   /// ✅ Called on app start — load immediately
//   void initAdLoad() {
//     debugPrint("🚀 Initial ad load...");
//     loadAd();
//   }
//
//   /// ✅ Show ad only if available and cooldown is over
//   void showAdIfAvailable() {
//     if (_interstitialAd != null && _isCooldownOver) {
//       _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
//         onAdDismissedFullScreenContent: (ad) {
//           ad.dispose();
//           _interstitialAd = null;
//           _lastAdShown = DateTime.now();
//           debugPrint("🧹 Ad dismissed. Scheduled next preload in $cooldownSeconds seconds.");
//           _scheduleNextLoad(); // Schedule next load
//         },
//         onAdFailedToShowFullScreenContent: (ad, error) {
//           ad.dispose();
//           _interstitialAd = null;
//           debugPrint("❌ Failed to show ad: $error");
//           _scheduleNextLoad(); // Still schedule next
//         },
//       );
//       _interstitialAd!.setImmersiveMode(true);
//       _interstitialAd!.show();
//       debugPrint("🎉 Ad shown at $_lastAdShown");
//     } else {
//       if (!_isCooldownOver) {
//         debugPrint("⏱️ Cooldown active. Wait before showing another ad.");
//       } else {
//         debugPrint("⚠️ No ad available to show. Preloading...");
//         loadAd(); // If not available, try loading
//       }
//     }
//   }
//
//   /// ✅ Schedule ad load after fixed cooldown
//   void _scheduleNextLoad() {
//     _delayedLoadTimer?.cancel();
//     _delayedLoadTimer = Timer(Duration(seconds: cooldownSeconds), () {
//       debugPrint("⏳ Cooldown complete. Loading next ad...");
//       loadAd();
//     });
//   }
//
//   /// ✅ Load ad only if not already available
//   void loadAd() {
//     if (_interstitialAd != null) {
//       debugPrint("🟡 Ad already loaded. Skipping load.");
//       return;
//     }
//
//     _loadAdxAd(
//       onSuccess: () => debugPrint('✅ ADx interstitial ad loaded.'),
//       onFailure: () {
//         _loadAdmobAd(
//           onSuccess: () => debugPrint('✅ AdMob interstitial ad loaded.'),
//           onFailure: () =>
//               debugPrint("❌ Failed to load both ADX and AdMob interstitial ads."),
//         );
//       },
//     );
//   }
//
//   bool get _isCooldownOver =>
//       DateTime.now().difference(_lastAdShown) >= Duration(seconds: cooldownSeconds);
//
//   void _loadAdxAd({
//     required VoidCallback onSuccess,
//     required VoidCallback onFailure,
//   }) {
//     debugPrint("🎯 Loading ADX: $adxAdUnitId");
//     InterstitialAd.load(
//       adUnitId: adxAdUnitId,
//       request: const AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (InterstitialAd ad) {
//           debugPrint('✅ ADX Loaded');
//           _interstitialAd = ad;
//           isAdxAd = true;
//           onSuccess();
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           debugPrint("❌ ADX Load failed: $error");
//           onFailure();
//         },
//       ),
//     );
//   }
//
//   void _loadAdmobAd({
//     required VoidCallback onSuccess,
//     required VoidCallback onFailure,
//   }) {
//     debugPrint("🎯 Loading AdMob: $admobAdUnitId");
//     InterstitialAd.load(
//       adUnitId: admobAdUnitId,
//       request: const AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (InterstitialAd ad) {
//           debugPrint('✅ AdMob Loaded');
//           _interstitialAd = ad;
//           isAdxAd = false;
//           onSuccess();
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           debugPrint("❌ AdMob Load failed: $error");
//           onFailure();
//         },
//       ),
//     );
//   }
//
//   void dispose() {
//     _interstitialAd?.dispose();
//     _delayedLoadTimer?.cancel();
//     _interstitialAd = null;
//   }
// }

class AdManager {
  InterstitialAd? _interstitialAd;
  ValueNotifier<bool?> isAdxAd = ValueNotifier<bool?>(null);
  Timer? _delayedLoadTimer;

  DateTime _lastAdShown = DateTime.now().subtract(Duration(seconds: 60));
  final int cooldownSeconds = adsIdsModel.adx?.isShow ?? 60;

  static String adxAdUnitId = adsIdsModel.adx?.intertitialAd ??
      '/23195226677,23207348059/illustratorguides_vedansh_interstital';
  static String admobAdUnitId = adsIdsModel.admob?.intertitialAd ??
      'ca-app-pub-4389462255518752/6384430585 ';


  RxBool get isAdAvailable => _interstitialAd != null ? true.obs :false.obs;

RxBool isAdLoad = false.obs;
  /// ✅ Called on app start — load immediately
  void initAdLoad() {
    debugPrint("🚀 Initial ad load...");
    loadAd();
  }

  /// ✅ Show ad only if available and cooldown is over
  void showAdIfAvailable() {
    if (_interstitialAd != null && _isCooldownOver) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _interstitialAd = null;
          _lastAdShown = DateTime.now();
          debugPrint("🧹 Ad dismissed. Scheduled next preload in $cooldownSeconds seconds.");
          _scheduleNextLoad(); // Schedule next load
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _interstitialAd = null;
          debugPrint("❌ Failed to show ad: $error");
          _scheduleNextLoad(); // Still schedule next
        },
      );
      _interstitialAd!.setImmersiveMode(true);
      _interstitialAd!.show();
      debugPrint("🎉 Ad shown at $_lastAdShown");
    } else {
      if (!_isCooldownOver) {
        debugPrint("⏱️ Cooldown active. Wait before showing another ad.");
      } else {
        debugPrint("⚠️ No ad available to show. Preloading...");
       // loadAd(); // If not available, try loading
      }
    }
  }

  /// ✅ Schedule ad load after fixed cooldown
  void _scheduleNextLoad() {
    _delayedLoadTimer?.cancel();
    _delayedLoadTimer = Timer(Duration(seconds: cooldownSeconds), () {
      debugPrint("⏳ Cooldown complete. Loading next ad...");
      loadAd();
    });
  }

  /// ✅ Load ad only if not already available
  void loadAd() {
    if (_interstitialAd != null) {
      debugPrint("🟡 Ad already loaded. Skipping load.");
      return;
    }

    _loadAdxAd(
      onSuccess: (){
        isAdLoad.value = true;
      },
      onFailure: () {
        _loadAdmobAd(
          onSuccess: () {
            isAdLoad.value = true;
          },
          onFailure: () {
            isAdLoad.value = false;
            isAdxAd.value = null;
            debugPrint("❌ Failed to load both ADX and AdMob interstitial ads.");
            _scheduleNextLoad(); // Attempt loading ads periodically
          },
        );
      },
    );
  }

  bool get _isCooldownOver =>
      DateTime.now().difference(_lastAdShown) >= Duration(seconds: cooldownSeconds);

  void _loadAdxAd({
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) {
    debugPrint("🎯 Loading ADX: $adxAdUnitId");
    InterstitialAd.load(
      adUnitId: adxAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          debugPrint('✅ ADX Loaded');
          _interstitialAd = ad;
          isAdxAd.value = true;
          onSuccess();
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint("❌ ADX Load failed: $error");
          onFailure();
        },
      ),
    );
  }

  void _loadAdmobAd({
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) {
    debugPrint("🎯 Loading AdMob: $admobAdUnitId");
    InterstitialAd.load(
      adUnitId: admobAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          debugPrint('✅ AdMob Loaded');
          _interstitialAd = ad;
          isAdxAd.value = false;
          onSuccess();
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint("❌ AdMob Load failed: $error");
          onFailure();
        },
      ),
    );
  }

  void dispose() {
    _interstitialAd?.dispose();
    _delayedLoadTimer?.cancel();
    _interstitialAd = null;
  }
}
