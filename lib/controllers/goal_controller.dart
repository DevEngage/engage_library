import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earn_it/models/goal_model.dart';
import 'package:earn_it/models/task_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GoalController extends GetxController {
  List<GoalModel> goals = [];
  List<GoalModel> searched = [];
  GoalModel? goalEdit;
  TaskModel? taskEdit;
  // String lastQuery;
  int goalsCompleted = 0;
  int tasksCompleted = 0;
  final ref =
      FirebaseFirestore.instance.collection('goals').withConverter<GoalModel>(
            fromFirestore: (snapshot, _) =>
                GoalModel.fromJson(snapshot.data()!, snapshot.id),
            toFirestore: (doc, _) => doc.toJson(),
          );
  static GoalController to = Get.find();
  static List categories = <String>["None", "Food", "Climbing", "Walking"];

  GoalController();
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
        .collection('goals')
        .where('owner', isEqualTo: auth.currentUser?.uid)
        .withConverter<GoalModel>(
          fromFirestore: (snapshot, _) =>
              GoalModel.fromJson(snapshot.data()!, snapshot.id),
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

  watchList() {
    // final Stream<QuerySnapshot> stream = ref.snapshots();
    // stream.listen((snapshot) {
    //   snapshot.docs.
    // });
  }

  Future getList() async {
    goals = (await ref.get()).docs.map((item) => item.data()).toList();
    update();
    // goals = await GoalModel().getUserGoals();
    // if (lastQuery != null) {
    //   search();
    // } else {
    //   update();
    // }
  }

  getUserGoals() {}

  addTask() {}

  saveGoal() {}

  // refreshTasks(GoalModel goal) async {
  //   await goal.getTask();
  //   update();
  // }

  // refresh() {
  //   update();
  // }

  removeTask(GoalModel goal, TaskModel task) async {
    await ref.doc(goal.id).collection('tasks').doc(task.id).delete();
    update();
  }

  removeGoal(GoalModel goal) async {
    WriteBatch batch = FirebaseFirestore.instance.batch();
    return ref.doc(goal.id).collection('tasks').get().then((querySnapshot) {
      querySnapshot.docs.forEach((document) {
        batch.delete(document.reference);
      });
      return batch.commit();
    });
  }

  Future toggleTask(GoalModel goal, TaskModel task) async {
    await goal.toggleTask(task);
    await getCount();
    update();
  }

  getCount() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    goalsCompleted =
        (await ownerRef.where('isDone', isEqualTo: true).get()).size ?? 0;
    tasksCompleted = (await FirebaseFirestore.instance
            .collectionGroup('tasks')
            .where('owner', isEqualTo: auth.currentUser?.uid)
            .where('isDone', isEqualTo: true)
            .get())
        .size;
  }

  // List<Goal> get list =>
  //     searched.isEmpty && lastQuery == null ? goals : searched;
}
