import 'package:engage_library/modules/tasks/tasks_controller.dart';
import 'package:engage_library/screens/base_screen.dart';
import 'package:engage_library/utils/engagefire_collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EngageTasksScreen extends StatelessWidget {
  final String path;
  const EngageTasksScreen({Key? key, this.path = 'tasks'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasksCtrl = Get.put(EngageTasksController());
    final tasksCol = Get.put(EngagefireCollection(path: path));
    return EngageBaseScreen(
      body: Container(),
    );
  }
}
