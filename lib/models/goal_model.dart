import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earn_it/models/task_model.dart';

/* 
  TODO:
  [ ] cache for not logged in
 */

class GoalModel {
  String name = '';
  String details = '';
  String reward = '';
  String keyDetails = '';
  String category = 'None';
  String? owner;
  String? id;
  bool isDone = false;
  num taskCount = 0;
  DateTime? dueAt;
  DateTime? created;
  DateTime? updated;
  List<TaskModel> tasks = [];
  CollectionReference<TaskModel>? taskRef;

  GoalModel([Map? data]);

  GoalModel.fromJson(Map data) {
    id = data['\$id'];
    name = data['name'];
    details = data['details'];
    reward = data['reward'];
    dueAt = data['dueAt'];
    isDone = data['isDone'] ?? false;
    category = data['category'];
    taskRef = FirebaseFirestore.instance
        .collection('goals')
        .doc(id)
        .collection('tasks')
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
          toFirestore: (doc, _) => doc.toJson(),
        );
  }

  toJson() {
    return {
      // 'id': id,
      'name': name,
      'details': details,
      'reward': reward,
      'dueAt': dueAt,
      'isDone': isDone,
      'category': category,
    };
  }

  getTasks() async {
    tasks =
        (await taskRef?.get())?.docs.map((item) => item.data()).toList() ?? [];
  }

  toggleTask(TaskModel task) async {
    await taskRef?.doc(task.id).update({
      ...task.toJson(),
      'isDone': task.isDone,
    });
  }

  addTask(TaskModel task) async {
    await taskRef?.add(task.toJson());
  }

  removeTask(TaskModel task) {}

  save() {}

  remove() {}
}
