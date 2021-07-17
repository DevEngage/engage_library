import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class Analytics {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static bool isEnabled = true;
  Analytics._();

  static init() async {
    final status = await AppTrackingTransparency.requestTrackingAuthorization();
    Analytics.isEnabled = status == TrackingStatus.authorized;
    if (Analytics.isEnabled) {
      await Analytics.analytics.logAppOpen();
    }
  }

  static logEvent({
    required String name,
    Map<String, dynamic>? params,
  }) async {
    if (Analytics.isEnabled == false) return;
    await Analytics.analytics.logEvent(
      name: name,
      parameters: params,
    );
  }

  static setUser(String? userId) async {
    if (userId == null || Analytics.isEnabled == false) return;
    return await analytics.setUserId(userId);
  }
}
