import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:illustrator_guide/app/app.dart';

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

  DateTime _lastAdShown = DateTime.now().subtract(const Duration(seconds: 60));
  final int cooldownSeconds = adsIdsModel.adx?.isShow ?? 60;

  static String adxRewardAdUnitId = adsIdsModel.adx?.rewaredIntertitialAd ??
      '/23195226677,23207348059/illustratorguides_vedansh_rewarded';

  static String admobRewardAdUnitId = adsIdsModel.admob?.rewaredIntertitialAd ??
      'ca-app-pub-4389462255518752/5071348914';

  bool get isAdAvailable => _rewardedAd != null;

  /// ✅ Called on app start — load immediately
  void initAdLoad() {
    debugPrint("🚀 Initial rewarded ad load...");
    loadAd();
  }

  /// ✅ Show ad only if available and cooldown is over
  void showAdIfAvailable({required VoidCallback onRewardEarned}) {
    if (_rewardedAd != null && _isCooldownOver) {
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _rewardedAd = null;
          _lastAdShown = DateTime.now();
          debugPrint(
              "🧹 Reward ad dismissed. Scheduling next preload in $cooldownSeconds seconds.");
          _scheduleNextLoad();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _rewardedAd = null;
          debugPrint("❌ Failed to show reward ad: $error");
          _scheduleNextLoad();
        },
      );

      _rewardedAd!.setImmersiveMode(true);
      _rewardedAd!.show(
          onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
        debugPrint("🎁 Reward earned: ${reward.amount} ${reward.type}");
        onRewardEarned();
      });

      debugPrint("🎉 Reward ad shown at $_lastAdShown");
    } else {
      if (!_isCooldownOver) {
        debugPrint(
            "⏱️ Cooldown active. Wait before showing another reward ad.");
      } else {
        debugPrint("⚠️ No reward ad available to show. Preloading...");
        // loadAd();
      }
    }
  }

  /// ✅ Schedule ad load after fixed cooldown
  void _scheduleNextLoad() {
    _delayedLoadTimer?.cancel();
    _delayedLoadTimer = Timer(Duration(seconds: cooldownSeconds), () {
      debugPrint("⏳ Cooldown complete. Loading next reward ad...");
      loadAd();
    });
  }

  /// ✅ Load ad only if not already available
  void loadAd() {
    if (_rewardedAd != null) {
      debugPrint("🟡 Reward ad already loaded. Skipping load.");
      return;
    }

    _loadAdxAd(
      onSuccess: () {
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
            debugPrint("❌ Failed to load both ADX and AdMob rewarded ads.");
            // Retry after a delay to improve fill rate
            debugPrint("⏳ Retrying to load ads...");
            _scheduleNextLoad();
          },
        );
      },
    );
  }

  bool get _isCooldownOver =>
      DateTime.now().difference(_lastAdShown) >=
      Duration(seconds: cooldownSeconds);

  void _loadAdxAd({
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) {
    debugPrint("🎯 Loading ADX reward ad: $adxRewardAdUnitId");
    RewardedAd.load(
      adUnitId: adxRewardAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          debugPrint('✅ ADX Rewarded Loaded');
          _rewardedAd = ad;
          isAdxAd.value = true;
          onSuccess();
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint("❌ ADX Rewarded Load failed: $error");
          onFailure();
        },
      ),
    );
  }

  void _loadAdmobAd({
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) {
    debugPrint("🎯 Loading AdMob reward ad: $admobRewardAdUnitId");
    RewardedAd.load(
      adUnitId: admobRewardAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          debugPrint('✅ AdMob Rewarded Loaded');
          _rewardedAd = ad;
          isAdxAd.value = false;
          onSuccess();
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint("❌ AdMob Rewarded Load failed: $error");
          onFailure();
        },
      ),
    );
  }

  void dispose() {
    _rewardedAd?.dispose();
    _delayedLoadTimer?.cancel();
    _rewardedAd = null;
  }
}
