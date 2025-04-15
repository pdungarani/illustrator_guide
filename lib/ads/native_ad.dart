// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// class NativeAdManager {
//   NativeAd? _nativeAd;
//   bool isAdxAd = true;
//   bool _isLoading = false;
//
//   static const String adxAdUnitId = 'ca-app-pub-3940256099942544/2247696110'; // Test Native Ad
//   static const String admobAdUnitId = 'ca-app-pub-3940256099942544/2247696110'; // Test Native Ad
//
//   bool get isAdAvailable => _nativeAd != null;
//
//   void preloadAd() {
//     if (_isLoading || _nativeAd != null) return;
//     _isLoading = true;
//
//     _loadAdxAd(
//       onSuccess: () {
//         debugPrint("✅ ADX Native Ad loaded");
//         _isLoading = false;
//       },
//       onFailure: () {
//         _loadAdmobAd(
//           onSuccess: () {
//             debugPrint("✅ AdMob Native Ad loaded");
//             _isLoading = false;
//           },
//           onFailure: () {
//             debugPrint("❌ Both native ad networks failed.");
//             _isLoading = false;
//           },
//         );
//       },
//     );
//   }
//
//   Widget getAdWidget() {
//     if (_nativeAd != null) {
//       return Container(
//         margin: const EdgeInsets.all(10),
//         height: 100,
//         child: AdWidget(ad: _nativeAd!),
//       );
//     } else {
//       return const SizedBox.shrink();
//     }
//   }
//
//   void _loadAdxAd({
//     required VoidCallback onSuccess,
//     required VoidCallback onFailure,
//   }) {
//     _nativeAd = NativeAd(
//         adUnitId: adxAdUnitId,
//         listener: NativeAdListener(
//           onAdLoaded: (ad) {
//             debugPrint('$NativeAd loaded.');
//           },
//           onAdFailedToLoad: (ad, error) {
//             // Dispose the ad here to free resources.
//             debugPrint('$NativeAd failed to load: $error');
//             ad.dispose();
//           },
//         ),
//         request: const AdRequest(),
//         nativeTemplateStyle: NativeTemplateStyle(
//           // Required: Choose a template.
//             templateType: TemplateType.medium,
//             // Optional: Customize the ad's style.
//             mainBackgroundColor: Colors.purple,
//             cornerRadius: 10.0,
//             callToActionTextStyle: NativeTemplateTextStyle(
//                 textColor: Colors.cyan,
//                 backgroundColor: Colors.red,
//                 style: NativeTemplateFontStyle.monospace,
//                 size: 16.0),
//             primaryTextStyle: NativeTemplateTextStyle(
//                 textColor: Colors.red,
//                 backgroundColor: Colors.cyan,
//                 style: NativeTemplateFontStyle.italic,
//                 size: 16.0),
//             secondaryTextStyle: NativeTemplateTextStyle(
//                 textColor: Colors.green,
//                 backgroundColor: Colors.black,
//                 style: NativeTemplateFontStyle.bold,
//                 size: 16.0),
//             tertiaryTextStyle: NativeTemplateTextStyle(
//                 textColor: Colors.brown,
//                 backgroundColor: Colors.amber,
//                 style: NativeTemplateFontStyle.normal,
//                 size: 16.0)))..load();
//   }
//
//   void _loadAdmobAd({
//     required VoidCallback onSuccess,
//     required VoidCallback onFailure,
//   }) {
//     _nativeAd = NativeAd(
//         adUnitId: admobAdUnitId,
//         listener: NativeAdListener(
//           onAdLoaded: (ad) {
//             debugPrint('$NativeAd loaded.');
//           },
//           onAdFailedToLoad: (ad, error) {
//             // Dispose the ad here to free resources.
//             debugPrint('$NativeAd failed to load: $error');
//             ad.dispose();
//           },
//         ),
//         request: const AdRequest(),
//         nativeTemplateStyle: NativeTemplateStyle(
//           // Required: Choose a template.
//             templateType: TemplateType.medium,
//             // Optional: Customize the ad's style.
//             mainBackgroundColor: Colors.purple,
//             cornerRadius: 10.0,
//             callToActionTextStyle: NativeTemplateTextStyle(
//                 textColor: Colors.cyan,
//                 backgroundColor: Colors.red,
//                 style: NativeTemplateFontStyle.monospace,
//                 size: 16.0),
//             primaryTextStyle: NativeTemplateTextStyle(
//                 textColor: Colors.red,
//                 backgroundColor: Colors.cyan,
//                 style: NativeTemplateFontStyle.italic,
//                 size: 16.0),
//             secondaryTextStyle: NativeTemplateTextStyle(
//                 textColor: Colors.green,
//                 backgroundColor: Colors.black,
//                 style: NativeTemplateFontStyle.bold,
//                 size: 16.0),
//             tertiaryTextStyle: NativeTemplateTextStyle(
//                 textColor: Colors.brown,
//                 backgroundColor: Colors.amber,
//                 style: NativeTemplateFontStyle.normal,
//                 size: 16.0)))..load();
//   }
//
//   void dispose() {
//     _nativeAd?.dispose();
//     _nativeAd = null;
//   }
// }
