import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_platform/universal_platform.dart';

class Ads {
  static final Ads _singleton = Ads._internal();
  static bool disableAds = false;
  bool intialized = false;
  String admobAppId;
  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['Video Games', 'Mobile', 'Game News'],
    // contentUrl: 'https://flutter.io',
    childDirected: false,
    testDevices: <String>[], // Android emulators are considered test devices
  );

  BannerAd myBanner;
  InterstitialAd myInterstitial;

  factory Ads() {
    return _singleton;
  }

  Ads._internal();

  init() async {
    if (UniversalPlatform.isWeb || disableAds == true) return;
    if (kReleaseMode) {
      admobAppId = 'ca-app-pub-9728605767178190~4744757421';
    } else {
      admobAppId = FirebaseAdMob.testAppId;
    }
    await FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
  }

  loadInterstitial() async {
    if (UniversalPlatform.isWeb || disableAds == true) return;

    if (intialized == false) {
      await init();
      intialized = true;
    }
    myInterstitial = InterstitialAd(
      adUnitId: UniversalPlatform.isAndroid
          ? 'ca-app-pub-9728605767178190/1304863371'
          : 'ca-app-pub-9728605767178190/1460776045',
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );
    myInterstitial
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
  }

  loadBanner({
    anchorOffset = 60.0,
    horizontalCenterOffset = 0.0,
    AnchorType anchorType = AnchorType.bottom,
  }) async {
    if (UniversalPlatform.isWeb || disableAds == true) return;

    if (intialized == false) {
      await init();
      intialized = true;
    }
    if (myBanner == null) {
      myBanner = BannerAd(
        adUnitId: UniversalPlatform.isAndroid
            ? 'ca-app-pub-9728605767178190/9913981138'
            : 'ca-app-pub-9728605767178190/8026184393',
        size: AdSize.smartBanner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("BannerAd event is $event");
        },
      );
    }
    myBanner
      // typically this happens well before the ad is shown
      ..load()
      ..show(
        // Positions the banner ad 60 pixels from the bottom of the screen
        anchorOffset: anchorOffset,
        // Positions the banner ad 10 pixels from the center of the screen to the right
        horizontalCenterOffset: horizontalCenterOffset,
        // Banner Position
        anchorType: anchorType,
      );
  }

  hideBanner() async {
    if (UniversalPlatform.isWeb || disableAds == true) return;
    if (intialized == false) {
      await init();
      intialized = true;
    }

    if (myBanner != null) {
      myBanner.dispose();
      myBanner = null;
    }
  }
}
