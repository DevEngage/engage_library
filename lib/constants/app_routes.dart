import 'package:engage_library/screens/admin_screen.dart';
import 'package:engage_library/screens/home_screen.dart';
import 'package:engage_library/screens/login_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GetPage(name: '/', page: () => EngageHomeScreen()),
    GetPage(name: '/login', page: () => EngageLoginScreen()),
    GetPage(name: '/admin', page: () => EngageAdminScreen()),
  ];
}
