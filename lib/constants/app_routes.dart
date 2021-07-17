import 'package:earn_it/controllers/ads_controller.dart';
import 'package:earn_it/main.dart';
import 'package:earn_it/screens/goal_edit_screens.dart';
import 'package:earn_it/screens/goal_screen.dart';
import 'package:earn_it/screens/login_screen.dart';
import 'package:earn_it/screens/task_edit_screens.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();

  loadBanner() {
    if (!GetPlatform.isWeb) AdsController().loadBanner();
  }

  hideBanner() {
    if (!GetPlatform.isWeb) AdsController().hideBanner();
  }

  static final routes = [
    GetPage(name: '/', page: () => MyHomePage()),
    GetPage(name: '/home', page: () => MyHomePage()),
    GetPage(name: '/viewGoal', page: () => GoalScreen()),
    GetPage(name: '/editGoal', page: () => GoalEdit()),
    GetPage(name: '/editTask', page: () => TaskEdit()),
    GetPage(name: '/login', page: () => LoginScreen()),
  ];
}
