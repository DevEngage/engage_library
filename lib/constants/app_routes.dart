import 'package:engaged/screens/home_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GetPage(name: '/', page: () => EngagedHomeScreen()),
  ];
}
