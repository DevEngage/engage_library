import 'package:EarnIt/models/task_model.dart';
import 'package:backendless_sdk/backendless_sdk.dart';
// import 'package:engagefire/core/doc.dart';
// import 'package:engagefire/core/firestore.dart';

/* 
  TODO:
  [ ] cache for not logged in
 */

class GoalModel {
  String name = '';
  DateTime dueAt;
  String details = '';
  String reward = '';
  bool isDone = false;
  String category = '';
  DateTime created;
  DateTime updated;
  BackendlessUser owner;
  String objectId;

  List tasks = [];
  // List<TaskModel> $tasks = [];

  GoalModel([Map data]) {
    if (data != null) map(data);
    // if (data != null) {
    //   $doc = EngageDoc.fromMap(data);
    // } 
    // else {
    //   $collection = EngageFirestore.getInstance('users/{userId}/goals');
    // }
  }

  // GoalModel.fromId() {
  //   createBlank()
  // }

  GoalModel.fromFirestore(doc) {
    // $doc = EngageDoc.fromFirestore(doc);
    // map($doc.$doc);
  }

  GoalModel.engage(Map doc) {
    // $doc = doc;
    // map($doc.$doc);
  }

  map(Map data) {
    objectId = data['objectId'];
    name = data['name'];
    details = data['details'];
    reward = data['reward'];
    dueAt = data['dueAt'];
    isDone = data['isDone'];
    category = data['category'];
  }

  Future createNew() async {
    var saved = await Backendless.data.of('goal').save({ //users/{userId}/
      'objectId': objectId,
      'name': name,
      'details': details,
      'reward': reward,
      'dueAt': dueAt,
      'isDone': isDone,
      'category': category,
    });
    print(saved);
    // map(saved);
    // map($doc.$doc);
  }

  Future save() async {
    if (objectId == null) {
      await createNew();
      return;
    }
    // $doc.$doc['\$id'] = $id;
    // $doc.$doc['details'] = details;
    // $doc.$doc['reward'] = reward;
    // $doc.$doc['dueAt'] = dueAt;
    // $doc.$doc['isDone'] = isDone;
    // $doc.$doc['category'] = category;
    // await $doc.$save();
  }

  Future toogleCheck() async { 
    isDone = !isDone;
    // await save();
    return isDone;
  }

  cleanUp() {

  }

  Future getTasks() async {
    // $tasks = await $doc.$getSub('tasks').getList();
    return [];
  }

  Future saveTask(TaskModel task) async {
    // bool isNew = task.$id == null;
    // await task.save();
    // // EngageDoc savedTask = await $doc.$getSub('tasks').save(task);
    // if (isNew) $tasks.add(task);
  }

}