import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: ColorsValue.primaryColor,
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
        initialRoute: Routes.homeScreen,
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
