export './constants/constants.dart';
export './screens/screens.dart';
export './widgets/widgets.dart';

import 'package:engage_library/constants/constants.dart';
import 'package:engage_library/controllers/user_controller.dart';
import 'package:engage_library/utils/engagefire.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Engage {
  static bool adsEnabled = true;
  static bool analyticsEnabled = true;
  static bool firestoreEnabled = true;
  static bool autoLoginAnonEnabled = true;
  static bool emulatorOnLocal = true;
  Engage();

  static init({
    enableAds = true,
    enableAnalytics = true,
    enableFirestore = true,
    enableAutoLoginAnon = true,
    enableEmulatorOnLocal = true,
  }) async {
    adsEnabled = enableAds;
    analyticsEnabled = enableAnalytics;
    firestoreEnabled = enableFirestore;
    autoLoginAnonEnabled = enableAutoLoginAnon;

    await Firebase.initializeApp();
    await Engagefire.init();
    await GetStorage.init();
    await EngageAnalytics.init();
    if (GetPlatform.isAndroid || EngageAnalytics.isEnabled) {
      await MobileAds.instance.initialize();
    }
    await EngageUserController().loginAnonAccount();
  }
}
