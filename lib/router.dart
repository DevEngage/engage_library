import 'package:EarnIt/main.dart';
import 'package:EarnIt/providers/ads_provider.dart';
import 'package:EarnIt/screens/goal_edit_screens.dart';
import 'package:EarnIt/screens/goal_screen.dart';
import 'package:EarnIt/screens/login_screen.dart';
import 'package:EarnIt/screens/task_edit_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_platform/universal_platform.dart';

bool hasOnboarded = false;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (!UniversalPlatform.isWeb) Ads().hideBanner();
    switch (settings.name) {
      case '/':
        if (!UniversalPlatform.isWeb) Ads().loadBanner();
        return GetRoute(
          page: MyHomePage(), // user != null ?  : LoginScreen(),
          settings: settings,
        );
      case '/login':
        return GetRoute(
          page: LoginScreen(),
          settings: settings,
        );
      case '/home':
        if (!UniversalPlatform.isWeb) Ads().loadBanner();
        return GetRoute(
          page: MyHomePage(),
          settings: settings,
        );
      case '/editGoal':
        return GetRoute(
          page: GoalEdit(),
          settings: settings,
        );
      case '/viewGoal':
        if (!UniversalPlatform.isWeb) Ads().loadBanner();
        return GetRoute(
          page: GoalScreen(),
          settings: settings,
        );
      case '/editTask':
        return GetRoute(
          page: TaskEdit(),
          settings: settings,
        );
      default:
        return GetRoute(
            settings: settings,
            transition: Transition.fade,
            page: Scaffold(
              body:
                  Center(child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}
