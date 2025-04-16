import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:illustrator_guide/app/utils/utils.dart';
import 'package:lottie/lottie.dart';

// class RewardedAdManager {
//   RewardedAd? _rewardedAd;
//   bool isAdxAd = true;
//   bool _isLoading = false;
//   Timer? _retryTimer;
//   static String adxAdUnitId = adsIdsModel.adx?.rewaredIntertitialAd ??
//       '/23195226677,23207348059/biodatamarker_vedansh_rewarded';
//   static String admobAdUnitId = adsIdsModel.admob?.rewaredIntertitialAd ??
//       'ca-app-pub-4389462255518752/6158157738';
//   DateTime _lastAdShown = DateTime.now().subtract( Duration(seconds: int.parse(adsIdsModel.adx?.isShow.toString()??'60')*2));
//   final Duration _cooldownDuration =  Duration(seconds: adsIdsModel.adx?.isShow??60);
//   bool get _isCooldownOver =>
//       DateTime.now().difference(_lastAdShown) >= _cooldownDuration;
//   bool get isAdAvailable => _rewardedAd != null;
//   void _retryLater() {
//     _retryTimer?.cancel(); // avoid double retries
//     _retryTimer = Timer(Duration(seconds: 60), () {
//       debugPrint("🔁 Retrying preloadAd after failure...");
//      // preloadRewardedAd();
//     });
//   }
//
//   /// Call this to preload a rewarded ad
//   void preloadRewardedAd() {
//     if (_isLoading) return;
//     _isLoading = true;
//
//     _loadAdxAd(
//       onSuccess: () {
//          Utility.snacBar('✅ Adx reward ad preloaded', Colors.green);
//         _isLoading = false;
//       },
//       onFailure: () {
//         _loadAdmobAd(
//           onSuccess: () {
//              Utility.snacBar('✅ AdMob reward ad preloaded', Colors.green);
//             _isLoading = false;
//           },
//           onFailure: () {
//          //   _retryLater();
//             Utility.snacBar('❌ Failed to preload both ADX and AdMob Rewarded Ads.', Colors.red);
//             _isLoading = false;
//           },
//         );
//       },
//     );
//   }
//
//   /// Show rewarded ad and trigger callback on reward
//   void showAdIfAvailable(VoidCallback onRewardEarned) {
//     if (_rewardedAd != null && _isCooldownOver) {
//       _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
//         onAdDismissedFullScreenContent: (ad) {
//           ad.dispose();
//           _rewardedAd = null;
//           debugPrint("🧹 Ad dismissed.");
//           preloadRewardedAd(); // preload next
//         },
//         onAdFailedToShowFullScreenContent: (ad, error) {
//           ad.dispose();
//           _rewardedAd = null;
//           debugPrint("❌ Failed to show ad: $error");
//           preloadRewardedAd(); // retry load
//         },
//       );
//       _rewardedAd!.setImmersiveMode(true);
//       _rewardedAd!.show(
//           onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
//             debugPrint("🎁 User earned reward: ${reward.amount} ${reward.type}");
//             onRewardEarned(); // Trigger your reward logic
//           });
//       _lastAdShown = DateTime.now();
//       debugPrint("🎉 Ad shown at $_lastAdShown");
//     } else {
//       if (!_isCooldownOver) {
//         debugPrint("⏱️ Cooldown active. Wait before showing another ad.");
//       } else {
//         debugPrint("⚠️ No ad available to show. Preloading...");
//         preloadRewardedAd();
//       }
//     }
//   }
//
//   void _loadAdxAd({
//     required VoidCallback onSuccess,
//     required VoidCallback onFailure,
//   }) {
//     RewardedAd.load(
//       adUnitId: adxAdUnitId,
//       request: const AdRequest(),
//       rewardedAdLoadCallback: RewardedAdLoadCallback(
//         onAdLoaded: (RewardedAd ad) {
//           _rewardedAd = ad;
//           isAdxAd = true;
//           debugPrint("✅ ADX Rewarded loaded");
//
//           onSuccess();
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           debugPrint("ADX Rewarded failed: $error");
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
//     RewardedAd.load(
//       adUnitId: admobAdUnitId,
//       request: const AdRequest(),
//       rewardedAdLoadCallback: RewardedAdLoadCallback(
//         onAdLoaded: (RewardedAd ad) {
//           _rewardedAd = ad;
//           isAdxAd = false;
//           debugPrint("✅ AdMob Rewarded loaded");
//           onSuccess();
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           debugPrint("AdMob Rewarded failed: $error");
//           onFailure();
//         },
//       ),
//     );
//   }
//
//   void dispose() {
//     _rewardedAd?.dispose();
//     _rewardedAd = null;
//   }
// }
class RewardAdManager {
  RewardedAd? _rewardedAd;
  ValueNotifier<bool?> isAdxAd = ValueNotifier<bool?>(null);
  RxBool isAdLoad = false.obs;
  Timer? _delayedLoadTimer;

  final DateTime _lastAdShown =
      DateTime.now().subtract(const Duration(seconds: 60));
  final int cooldownSeconds = adsIdsModel.adx?.isShow ?? 60;

  static String adxRewardAdUnitId = adsIdsModel.adx?.rewaredIntertitialAd ??
      '/23195226677,23207348059/illustratorguides_vedansh_rewarded';
  static String admobRewardAdUnitId = adsIdsModel.admob?.rewaredIntertitialAd ??
      'ca-app-pub-4389462255518752/5071348914';

  bool get isAdAvailable => _rewardedAd != null;

  createRewardAd({required VoidCallback onComplete, bool isAfterAds = false}) {
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
                children: [Lottie.asset('assets/loading.json')],
              ),
            ),
          ),
        );
      },
    );

    // Try loading AdX first
    _loadAd(
      adUnitId: adxRewardAdUnitId,
      onLoaded: (ad) {
        _rewardedAd = ad;
        _rewardedAd!.setImmersiveMode(true);
        // Get.back(); // close dialog
        showRewardAd(onComplete: onComplete, isAfterAds: isAfterAds);
        debugPrint("RewardedAd Adx Ads");
      },
      onFailed: () {
        // Try AdMob fallback
        _loadAd(
          adUnitId: admobRewardAdUnitId, // Replace with your AdMob fallback
          onLoaded: (ad) {
            _rewardedAd = ad;
            _rewardedAd!.setImmersiveMode(true);
            //  Get.back(); // close dialog
            showRewardAd(onComplete: onComplete, isAfterAds: isAfterAds);
            debugPrint("RewardedAd AdMob Ads");
          },
          onFailed: () {
            Get.back(); // close dialog
            _rewardedAd = null;
            onComplete(); // fallback failed, just continue
          },
        );
      },
    );
  }

  void _loadAd({
    required String adUnitId,
    required Function(RewardedAd) onLoaded,
    required VoidCallback onFailed,
  }) {
    RewardedAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) => onLoaded(ad),
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint("Interstitial Ad failed for $adUnitId: $error");
          onFailed();
        },
      ),
    );
  }

  Future<void> showRewardAd(
      {required VoidCallback onComplete, bool isAfterAds = false}) async {
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

    if (_rewardedAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      Get.back();
      onComplete();
      return;
    }
    await Future.delayed(const Duration(seconds: 1), () {
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (ad) {
          Get.back();
          if (isAfterAds == false) {
            onComplete();
          }
        },
        onAdDismissedFullScreenContent: (ad) {
          _rewardedAd = null;
          if (isAfterAds == true) {
            onComplete();
          }
          ad.dispose();
        },
        onAdFailedToShowFullScreenContent: (ad, AdError error) {
          print('$ad onAdFailedToShowFullScreenContent: $error');
          Get.back();
          onComplete();
          _rewardedAd = null;
          ad.dispose();
        },
      );

      _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          debugPrint("✅ User earned reward: ${reward.amount} ${reward.type}");
          onComplete(); // Only called here when reward is earned
        },
      );
    });
  }
}
