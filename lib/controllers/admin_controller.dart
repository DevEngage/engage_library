import 'package:engage_library/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class EngageAdminController extends GetxController {
  int currentIndex = 0;
  static EngageAdminController to = Get.find();

  EngageAdminController();
  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTabTapped(int index) {
    currentIndex = index;
  }
}
