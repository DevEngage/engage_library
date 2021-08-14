import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earn_it/models/task_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

/* 
  TODO:
  [ ] cache for not logged in
 */

class GoalModel {
  String? id;
  String name = '';
  String details = '';
  String reward = '';
  String keyDetails = '';
  String category = 'None';
  String? templateId;
  String? owner;
  bool isDone = false;
  num taskCount = 0;
  int? dueAt;
  DateTime? dueAtDate;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<TaskModel> tasks = [];
  CollectionReference<GoalModel>? ref;
  CollectionReference<TaskModel>? taskRef;

  GoalModel([Map? data]);

  GoalModel.fromJson(Map data, String? _id) {
    id = _id ?? data['\$id'];
    name = data['name'];
    details = data['details'] ?? '';
    reward = data['reward'] ?? '';
    dueAt = data['dueAt'];
    taskCount = data['taskCount'] ?? 0;
    if (data['dueAt'] != null)
      dueAtDate = DateTime.fromMillisecondsSinceEpoch(data['dueAt']);
    if (data['createdAt'] != null)
      createdAt = DateTime.fromMillisecondsSinceEpoch(data['createdAt']);
    if (data['updatedAt'] != null)
      updatedAt = DateTime.fromMillisecondsSinceEpoch(data['updatedAt']);
    isDone = data['isDone'] ?? false;
    category = data['category'] ?? 'None';
    owner = data['owner'];
    templateId = data['templateId'];
    ref =
        FirebaseFirestore.instance.collection('goals').withConverter<GoalModel>(
              fromFirestore: (snapshot, _) =>
                  GoalModel.fromJson(snapshot.data()!, snapshot.id),
              toFirestore: (doc, _) => doc.toJson(),
            );
    taskRef = FirebaseFirestore.instance
        .collection('goals')
        .doc(id)
        .collection('tasks')
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) =>
              TaskModel.fromJson(snapshot.data()!, snapshot.id),
          toFirestore: (doc, _) => doc.toJson(),
        );
  }

  toJson() {
    return {
      '\$id': id,
      'name': name,
      'details': details,
      'reward': reward,
      'dueAt': dueAt,
      'isDone': isDone,
      'category': category,
      'taskCount': taskCount,
      'owner': owner,
      'templateId': templateId,
      'updatedAt': DateTime.now().millisecondsSinceEpoch,
      'createdAt': createdAt?.millisecondsSinceEpoch ??
          DateTime.now().millisecondsSinceEpoch,
    };
  }

  get startQuery {
    FirebaseAuth auth = FirebaseAuth.instance;
    return ref?.where('owner', isEqualTo: auth.currentUser?.uid);
  }

  getTasks() async {
    tasks =
        (await taskRef?.get())?.docs.map((item) => item.data()).toList() ?? [];
  }

  toggleTask(TaskModel task) async {
    await taskRef?.doc(task.id).update({
      ...task.toJson(),
      'isDone': !task.isDone,
    });
    await getTasks();
    await save();
  }

  addTask(TaskModel task) async {
    await task.save(this);
    taskCount += 1;
    await save();
  }

  removeTask(TaskModel task) async {
    await ref?.doc(id).collection('tasks').doc(task.id).delete();
    taskCount -= 1;
    await save();
  }

  save() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (owner == null) {
      owner = auth.currentUser?.uid;
    }
    try {
      if (id == null) {
        return await FirebaseFirestore.instance
            .collection('goals')
            .add(toJson());
      }
      isDone = tasks.every((element) => element.isDone);
      return await ref?.doc(id).update({...toJson()});
    } catch (error) {
      print(error);
      return null;
    }
  }

  remove() async {
    WriteBatch batch = FirebaseFirestore.instance.batch();
    await ref?.doc(id).collection('tasks').get().then((querySnapshot) {
      querySnapshot.docs.forEach((document) {
        batch.delete(document.reference);
      });
      return batch.commit();
    });
    await ref?.doc(id).delete();
  }

  copy() async {
    id = null;
    owner = null;
    var _tasks = await getTasks();
    var doc = await save();
    var tasksClone = _tasks.map((item) async => await (item
          ..id = null
          ..owner = null)
        .save(doc));
    await Future.wait(tasksClone);
    // doc.
  }

  DateTime? get getDueAt {
    if (dueAt == null) {
      // return DateTime.now();
      return null;
    }
    return DateTime.fromMillisecondsSinceEpoch(dueAt!);
  }

  set setDueAt(DateTime? _date) {
    if (_date == null) {
      dueAt = null;
      return;
    }
    dueAt = _date.millisecondsSinceEpoch;
  }
}
