import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earn_it/models/goal_model.dart';
import 'package:earn_it/models/task_model.dart';
import 'package:earn_it/models/template_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class TemplateController extends GetxController {
  List<TemplateModel> templates = [];
  List<GoalModel> searched = [];
  // String lastQuery;
  int goalsCompleted = 0;
  int tasksCompleted = 0;
  final ref = FirebaseFirestore.instance
      .collection('templates')
      .withConverter<TemplateModel>(
        fromFirestore: (snapshot, _) =>
            TemplateModel.fromJson(snapshot.data()!, snapshot.id),
        toFirestore: (doc, _) => doc.toJson(),
      );
  static TemplateController to = Get.find();
  static List categories = <String>["None", "Food", "Climbing", "Walking"];

  TemplateController();
  @override
  void onReady() async {
    super.onReady();
    watchList();
    // getList();
    getCount();
  }

  @override
  void onClose() {
    super.onClose();
  }

  get ownerRef {
    FirebaseAuth auth = FirebaseAuth.instance;
    return FirebaseFirestore.instance
        .collection('templates')
        .where('owner', isEqualTo: auth.currentUser?.uid)
        .withConverter<TemplateModel>(
          fromFirestore: (snapshot, _) =>
              TemplateModel.fromJson(snapshot.data()!, snapshot.id),
          toFirestore: (doc, _) => doc.toJson(),
        );
  }

  search([String? query]) {
    // lastQuery = query ?? lastQuery;
    // if (lastQuery.length < 3) searched = goals;
    // searched = goals
    //     .where((goal) =>
    //         goal.name.toLowerCase().contains(lastQuery.toLowerCase()) == true)
    //     .toList();
    update();
  }

  watchList() {}

  Future getList() async {
    templates = (await ref.get()).docs.map((item) => item.data()).toList();
    update();
  }

  removeGoal(GoalModel goal, TaskModel task) async {
    await ref.doc(goal.id).collection('goal').doc(task.id).delete();
    update();
  }

  // removeGoal(GoalModel goal) async {
  //   WriteBatch batch = FirebaseFirestore.instance.batch();
  //   return ref.doc(goal.id).collection('tasks').get().then((querySnapshot) {
  //     querySnapshot.docs.forEach((document) {
  //       batch.delete(document.reference);
  //     });
  //     return batch.commit();
  //   });
  // }

  Future toggleTask(GoalModel goal, TaskModel task) async {
    await goal.toggleTask(task);
    await getCount();
    update();
  }

  getCount() async {
    goalsCompleted = templates.length;
  }
}
