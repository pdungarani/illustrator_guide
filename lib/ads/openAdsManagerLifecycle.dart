import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:illustrator_guide/ads/open_ad.dart';
// import 'package:untitled5/ads/open_ad.dart';

/// Listens for app foreground events and shows app open ads.
class AppLifecycleReactor {
  OpenAdManager openAdManager = OpenAdManager();

  void listenToAppStateChanges() {
    AppStateEventNotifier.startListening();
    AppStateEventNotifier.appStateStream
        .forEach((state) => _onAppStateChanged(state));
  }

  Future<void> _onAppStateChanged(AppState appState) async {
    print(appState);
    print("-=-=-=-=-=-=-0");
    if (appState == AppState.foreground) {
      openAdManager.preloadOpenAd();
    }
  }
}
