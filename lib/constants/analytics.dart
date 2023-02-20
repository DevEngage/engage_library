import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/utils.dart';

class EngageAnalytics {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static bool isEnabled = true;
  EngageAnalytics._();

  static init() async {
    if (GetPlatform.isIOS) {
      final status =
          await AppTrackingTransparency.requestTrackingAuthorization();
      EngageAnalytics.isEnabled = status == TrackingStatus.authorized;
    }
    if (EngageAnalytics.isEnabled) {
      await EngageAnalytics.analytics.logAppOpen();
    }
  }

  static logEvent({
    required String name,
    Map<String, dynamic>? params,
  }) async {
    if (EngageAnalytics.isEnabled == false) return;
    await EngageAnalytics.analytics.logEvent(
      name: name,
      parameters: params,
    );
  }

  static setUser(String? userId) async {
    if (userId == null || EngageAnalytics.isEnabled == false) return;
    return await analytics.setUserId(id: userId);
  }
}
