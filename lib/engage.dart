export './constants/constants.dart';
export './screens/screens.dart';
export './widgets/widgets.dart';

class Engage {
  static bool enableAds = true;
  static bool enableAnalytics = true;
  static bool enableFirestore = true;
  static bool enableAutoLoginAnon = true;
  Engage();

  static init({
    enableAds = true,
    enableAnalytics = true,
    enableFirestore = true,
    enableAutoLoginAnon = true,
  }) async {
    
  }
}