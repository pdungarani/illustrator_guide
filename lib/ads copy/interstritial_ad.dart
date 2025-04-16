import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:illustrator_guide/app/utils/utils.dart';
import 'package:lottie/lottie.dart';

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
  ValueNotifier<bool?> isAdxAd = ValueNotifier<bool?>(null);
  Timer? _delayedLoadTimer;

  DateTime _lastAdShown = DateTime.now().subtract(Duration(seconds: 60));
  final int cooldownSeconds = adsIdsModel.adx?.isShow ?? 60;

  static String adxAdUnitId = adsIdsModel.adx?.intertitialAd ??
      '/23195226677,23207348059/illustratorguides_vedansh_interstital';
  static String admobAdUnitId = adsIdsModel.admob?.intertitialAd ??
      'ca-app-pub-4389462255518752/6384430585 ';

  RxBool get isAdAvailable => _interstitialAd != null ? true.obs :false.obs;

  InterstitialAd? _interstitialAd;

  createInterstitialAd({required VoidCallback onComplete, bool isAfterAds = false}) {
    // Show loading dialog
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
                children: [
                  Lottie.asset('assets/loading.json')
                ],
              ),
            ),
          ),
        );
      },
    );

    // Try loading AdX first
    _loadAd(
      adUnitId: adxAdUnitId,
      onLoaded: (ad) {
        _interstitialAd = ad;
        _interstitialAd!.setImmersiveMode(true);
       // Get.back(); // close dialog
        showInterstitialAd(onComplete: onComplete, isAfterAds: isAfterAds);
        debugPrint("Interstitial Adx Ads");
      },
      onFailed: () {
        // Try AdMob fallback
        _loadAd(
          adUnitId: admobAdUnitId, // Replace with your AdMob fallback
          onLoaded: (ad) {
            _interstitialAd = ad;
            _interstitialAd!.setImmersiveMode(true);
          //  Get.back(); // close dialog
            showInterstitialAd(onComplete: onComplete, isAfterAds: isAfterAds);
            debugPrint("Interstitial AdMob Ads");
          },
          onFailed: () {
            Get.back(); // close dialog
            _interstitialAd = null;
            onComplete(); // fallback failed, just continue
          },
        );
      },
    );
  }

  void _loadAd({
    required String adUnitId,
    required Function(InterstitialAd) onLoaded,
    required VoidCallback onFailed,
  }) {
    InterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) => onLoaded(ad),
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint("Interstitial Ad failed for $adUnitId: $error");
          onFailed();
        },
      ),
    );
  }

  Future<void> showInterstitialAd({required VoidCallback onComplete, bool isAfterAds = false}) async {
    // showDialog(
    //   barrierDismissible: false,
    //   context: Get.context!,
    //   builder: (context) {
    //     return WillPopScope(
    //       onWillPop: () async {
    //         return false;
    //       },
    //       child: SimpleDialog(
    //         elevation: 0,
    //         backgroundColor: Colors.transparent,
    //         title: Container(
    //             padding: const EdgeInsets.all(20),
    //             decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.circular(10)),
    //             child: const Column(
    //               children: [
    //                 Text("Ads Loading....",
    //                 ),
    //               ],
    //             )),
    //       ),/*Container(
    //           padding: EdgeInsets.all(20),
    //           decoration: BoxDecoration(
    //               color: Colors.white,
    //               borderRadius: BorderRadius.circular(10)),
    //           child: Column(
    //             children: [
    //
    //               Text("Ads Loading....",
    //               ),
    //             ],
    //           )),*/
    //       // child: SimpleDialog(
    //       //   elevation: 0,
    //       //   backgroundColor: Colors.transparent,
    //       //   title: Text("Adsssss......")
    //       // ),
    //     );
    //   },
    // );

    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      Get.back();
      onComplete();
      return;
    }
    await Future.delayed(const Duration(seconds: 1), () {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) {
           Get.back();
          if (isAfterAds == false) {
            onComplete();
          }
        },
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          if (isAfterAds == true) {
            onComplete();
          }
          ad.dispose();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          print('$ad onAdFailedToShowFullScreenContent: $error');
          Get.back();
          onComplete();
          ad.dispose();
        },
      );
      _interstitialAd!.show();
      _interstitialAd = null;
    });
  }

}
