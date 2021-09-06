export './constants/constants.dart';
export './screens/screens.dart';
export './widgets/widgets.dart';

import 'package:engage_library/constants/constants.dart';
import 'package:engage_library/controllers/user_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Engage {
  static bool adsEnabled = true;
  static bool analyticsEnabled = true;
  static bool firestoreEnabled = true;
  static bool autoLoginAnonEnabled = true;
  Engage();

  static init({
    enableAds = true,
    enableAnalytics = true,
    enableFirestore = true,
    enableAutoLoginAnon = true,
  }) async {
    adsEnabled = enableAds;
    analyticsEnabled = enableAnalytics;
    firestoreEnabled = enableFirestore;
    autoLoginAnonEnabled = enableAutoLoginAnon;

    await Firebase.initializeApp();
    // await GetStorage.init();
    await Analytics.init();
    if (GetPlatform.isAndroid || Analytics.isEnabled) {
      await MobileAds.instance.initialize();
    }
    await EngageUserController().loginAnonAccount();
  }
}