import 'package:engage_library/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class EngageModelsController extends GetxController {
  User? user;
  EngageProfileModel? profile;
  static EngageModelsController to = Get.find();

  EngageModelsController();
  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
