import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:illustrator_guide/ads%20copy/ads_controller.dart';
import 'package:illustrator_guide/app/app.dart';
import 'package:illustrator_guide/data/data.dart';
import 'package:illustrator_guide/device/device.dart';
import 'package:illustrator_guide/domain/domain.dart';
import 'package:illustrator_guide/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  } catch (e) {
    print("Failed to initialize Firebase: $e");
  }
  await initServices();
  await MobileAds.instance.initialize();
  await Utility.fetchData();
  runApp(const MyApp());
}

Future<void> initServices() async {
  await Hive.initFlutter();

  Get.put(
    Repository(
      Get.put(
        DeviceRepository(),
        permanent: true,
      ),
      Get.put(
          DataRepository(
            Get.put(
              ConnectHelper(),
              permanent: true,
            ),
          ),
          permanent: true),
    ),
  );

  /// Services
  await Get.putAsync(() => CommonService().init());
  await Get.putAsync(() => DbService().init());
}

class DbService extends GetxService {
  Future<DbService> init() async {
    await Get.find<DeviceRepository>().init();
    return this;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AdsController adsController = Get.put(AdsController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 745),
      builder: (_, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringConstants.appName,
        theme: themeData(context),
        darkTheme: darkThemeData(context),
        locale: getLanguage(),
        themeMode: ThemeMode.light,
        getPages: AppPages.pages,
        initialRoute: Routes.splashScreen,
        translations: TranslationsFile(),
        navigatorKey: Get.key,
        enableLog: true,
      ),
    );
  }

  Locale getLanguage() {
    var language = Get.find<Repository>().getStringValue(LocalKeys.language);
    if (language.isNotEmpty) {
      return Locale(language);
    } else {
      return const Locale('en');
    }
  }
}
