// import 'package:engagefire/core/doc.dart';
// import 'package:engagefire/mobile.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earn_it/models/goal_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TaskModel {
  String? id;
  String? parentId;
  String? name;
  String? details;
  String? category = "None";
  String? owner;
  int? dueAt;
  bool isDone = false;

  TaskModel();

  TaskModel.blank();

  TaskModel.fromJson(Map data, String? _id) {
    id = _id ?? data['\$id'];
    parentId = data['parentId'];
    name = data['name'];
    details = data['details'];
    dueAt = data['dueAt'];
    isDone = data['isDone'] ?? false;
    details = data['details'];
    owner = data['owner'];
  }

  toJson() {
    return {
      '\$id': id,
      'name': name,
      'details': details,
      'dueAt': dueAt,
      'isDone': isDone,
      'category': category,
      'parentId': parentId,
      'owner': owner,
    };
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

  save(GoalModel goal) async {
    parentId = goal.id;
    FirebaseAuth auth = FirebaseAuth.instance;
    if (owner == null) {
      owner = auth.currentUser?.uid;
    }
    try {
      if (id == null) {
        return await FirebaseFirestore.instance
            .collection('goals')
            .doc(goal.id)
            .collection('tasks')
            .add(toJson());
      }
      return await goal.taskRef?.doc(id).update(toJson());
    } catch (error) {
      print(error);
      return null;
    }
  }
}
