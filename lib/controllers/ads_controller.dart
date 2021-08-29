import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class EngageAdsController extends GetxController {
  static bool disableAds = false;
  static int adLoads = 0;
  bool intialized = false;
  late String admobAppId;
  late String interstitialUnitId;
  late String bannerUnitId;
  // MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  //   keywords: <String>['Video Games', 'Mobile', 'Game News'],
  //   // contentUrl: 'https://flutter.io',
  //   childDirected: false,
  //   testDevices: <String>[], // Android emulators are considered test devices
  // );

//   BannerAd myBanner;
//   InterstitialAd myInterstitial;
//   RewardedVideoAd rewardAd;
  InterstitialAd? _interstitialAd;
  static EngageAdsController to = Get.find();

  EngageAdsController();

  @override
  void onReady() async {
    super.onReady();
    init();
  }

  @override
  void onClose() {
    super.onClose();
  }

  init() async {
    if (GetPlatform.isWeb || disableAds == true) return;
    if (kReleaseMode) {
      admobAppId = 'pub-9728605767178190';
      interstitialUnitId = GetPlatform.isAndroid
          ? 'ca-app-pub-9728605767178190/1357471942'
          : 'ca-app-pub-9728605767178190/8406289541';
      bannerUnitId = GetPlatform.isAndroid
          ? 'ca-app-pub-9728605767178190/8981004618'
          : 'ca-app-pub-9728605767178190/1621389340';
    } else {
      // admobAppId = FirebaseAdMob.testAppId;
      interstitialUnitId = InterstitialAd.testAdUnitId;
      bannerUnitId = BannerAd.testAdUnitId;
    }
    // await FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
  }

  loadInterstitial({
    Function? onImpression,
    Function? onClosed,
    Function? onFailed,
  }) async {
    if (GetPlatform.isWeb || disableAds == true) return;

    // if (intialized == false) {
    //   await init();
    //   intialized = true;
    // }
    // myInterstitial = InterstitialAd(
    //   adUnitId: interstitialUnitId,
    //   targetingInfo: targetingInfo,
    //   listener: (MobileAdEvent event) {
    //     print("InterstitialAd event is $event");
    //   },
    // );
    // myInterstitial
    //   ..load()
    //   ..show(
    //     anchorType: AnchorType.bottom,
    //     anchorOffset: 0.0,
    //     horizontalCenterOffset: 0.0,
    //   );
    // myInterstitial.listener = (MobileAdEvent event) {
    //   if (event == MobileAdEvent.impression && onImpression != null) {
    //     onImpression();
    //   } else if (event == MobileAdEvent.closed && onClosed != null) {
    //     onClosed();
    //   } else if (onFailed != null) {
    //     onFailed();
    //   }
    // };
    if (_interstitialAd == null) {
      InterstitialAd.load(
        adUnitId: interstitialUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;
            _interstitialAd!.show();
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ),
      );
    } else {
      _interstitialAd!.show();
    }
  }

  loadInterstitialOnTurn([justLoad = false]) {
    EngageAdsController.adLoads++;
    if (justLoad) {
      loadInterstitial();
    } else if ((EngageAdsController.adLoads % 2) == 1) {
      loadInterstitial();
    }
  }

  loadBanner() {}
  hideBanner() {}

//   loadBanner({
//     anchorOffset = 60.0,
//     horizontalCenterOffset = 0.0,
//     AnchorType anchorType = AnchorType.bottom,
//   }) async {
//     if (UniversalPlatform.isWeb || disableAds == true) return;

//     if (intialized == false) {
//       await init();
//       intialized = true;
//     }
//     if (myBanner == null) {
//       myBanner = BannerAd(
//         adUnitId: bannerUnitId,
//         size: AdSize.smartBanner,
//         targetingInfo: targetingInfo,
//         listener: (MobileAdEvent event) {
//           print("BannerAd event is $event");
//         },
//       );
//     }
//     myBanner
//       // typically this happens well before the ad is shown
//       ..load()
//       ..show(
//         // Positions the banner ad 60 pixels from the bottom of the screen
//         anchorOffset: anchorOffset,
//         // Positions the banner ad 10 pixels from the center of the screen to the right
//         horizontalCenterOffset: horizontalCenterOffset,
//         // Banner Position
//         anchorType: anchorType,
//       );
//   }

//   Future<bool> showReward(Function onReward) async {
//     rewardAd = RewardedVideoAd.instance;
//     await rewardAd.load(
//       adUnitId: interstitialUnitId,
//       targetingInfo: targetingInfo,
//     );
//     rewardAd.listener =
//         (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
//       if (event == RewardedVideoAdEvent.rewarded) {
//         onReward(true);
//       }
//     };
//     return rewardAd.show();
//   }

//   hideBanner() async {
//     if (UniversalPlatform.isWeb || disableAds == true) return;
//     if (intialized == false) {
//       await init();
//       intialized = true;
//     }

//     if (myBanner != null) {
//       myBanner.dispose();
//       myBanner = null;
//     }
//   }
}

















// import 'package:firebase_admob/firebase_admob.dart';
// import 'package:flutter/foundation.dart';
// import 'package:universal_platform/universal_platform.dart';

// class Ads {
//   static final Ads _singleton = Ads._internal();
//   static bool disableAds = false;
//   bool intialized = false;
//   String admobAppId;
//   MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
//     keywords: <String>['Video Games', 'Mobile', 'Game News'],
//     // contentUrl: 'https://flutter.io',
//     childDirected: false,
//     testDevices: <String>[], // Android emulators are considered test devices
//   );

//   BannerAd myBanner;
//   InterstitialAd myInterstitial;

//   factory Ads() {
//     return _singleton;
//   }

//   Ads._internal();

//   init() async {
//     if (UniversalPlatform.isWeb || disableAds == true) return;
//     if (kReleaseMode) {
//       admobAppId = 'ca-app-pub-9728605767178190~4744757421';
//     } else {
//       admobAppId = FirebaseAdMob.testAppId;
//     }
//     await FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
//   }

//   // loadNativeAd() async {
//   //   if (UniversalPlatform.isWeb || disableAds == true) return;

//   //   if (intialized == false) {
//   //     await init();
//   //     intialized = true;
//   //   }
//   //   // ca-app-pub-9728605767178190/8016136606
//   //   myInterstitial = NativeAd(
//   //     adUnitId: UniversalPlatform.isAndroid
//   //         ? 'ca-app-pub-9728605767178190/1304863371'
//   //         : 'ca-app-pub-9728605767178190/1460776045',
//   //     targetingInfo: targetingInfo,
//   //     factoryId: '',
//   //     listener: (MobileAdEvent event) {
//   //       print("InterstitialAd event is $event");
//   //     },
//   //   );
//   //   myInterstitial
//   //     ..load()
//   //     ..show(
//   //       anchorType: AnchorType.bottom,
//   //       anchorOffset: 0.0,
//   //       horizontalCenterOffset: 0.0,
//   //     );
//   // }

//   // loadInterstitial() async {
//   //   if (UniversalPlatform.isWeb || disableAds == true) return;

//   //   if (intialized == false) {
//   //     await init();
//   //     intialized = true;
//   //   }
//   //   myInterstitial = InterstitialAd(
//   //     adUnitId: UniversalPlatform.isAndroid
//   //         ? 'ca-app-pub-9728605767178190/1304863371'
//   //         : 'ca-app-pub-9728605767178190/1460776045',
//   //     targetingInfo: targetingInfo,
//   //     listener: (MobileAdEvent event) {
//   //       print("InterstitialAd event is $event");
//   //     },
//   //   );
//   //   myInterstitial
//   //     ..load()
//   //     ..show(
//   //       anchorType: AnchorType.bottom,
//   //       anchorOffset: 0.0,
//   //       horizontalCenterOffset: 0.0,
//   //     );
//   // }

//   loadBanner({
//     anchorOffset = 70.0,
//     horizontalCenterOffset = 0.0,
//     AnchorType anchorType = AnchorType.top,
//   }) async {
//     if (UniversalPlatform.isWeb || disableAds == true) return;

//     if (intialized == false) {
//       await init();
//       intialized = true;
//     }
//     if (myBanner == null) {
//       myBanner = BannerAd(
//         adUnitId: UniversalPlatform.isAndroid
//             ? 'ca-app-pub-9728605767178190/9913981138'
//             : 'ca-app-pub-9728605767178190/8026184393',
//         size: AdSize.smartBanner,
//         targetingInfo: targetingInfo,
//         listener: (MobileAdEvent event) {
//           print("BannerAd event is $event");
//         },
//       );
//     }
//     myBanner
//       // typically this happens well before the ad is shown
//       ..load()
//       ..show(
//         // Positions the banner ad 60 pixels from the bottom of the screen
//         anchorOffset: anchorOffset,
//         // Positions the banner ad 10 pixels from the center of the screen to the right
//         horizontalCenterOffset: horizontalCenterOffset,
//         // Banner Position
//         anchorType: anchorType,
//       );
//   }

//   hideBanner() async {
//     if (UniversalPlatform.isWeb || disableAds == true) return;
//     if (intialized == false) {
//       await init();
//       intialized = true;
//     }

//     if (myBanner != null) {
//       myBanner.dispose();
//       myBanner = null;
//     }
//   }
// }
