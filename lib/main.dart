import 'package:engage_library/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await GetStorage.init();
  // await Analytics.init();
  // if (GetPlatform.isAndroid || Analytics.isEnabled) {
  //   await MobileAds.instance.initialize();
  // }
  // UserController.loginAnonAccount();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return GetMaterialApp(
      navigatorKey: Get.key,
      title: 'EngageLibrary',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      // themeMode: ThemeMode.system,
      themeMode: ThemeMode.dark,
      // theme: ThemeData(
      //   primarySwatch: Colors.deepPurple,
      // ),
      getPages: AppRoutes.routes,
      initialRoute: auth.currentUser != null ? "/" : "/admin",
      // navigatorObservers: [
      //   BotToastNavigatorObserver(),
      //   FirebaseAnalyticsObserver(analytics: Analytics.analytics)
      // ],
      // builder: BotToastInit(),
    );
  }
}
