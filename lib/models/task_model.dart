import 'package:engagefire/core/doc.dart';

class TaskModel {
  String name;
  String details;
  int dueAt;
  bool isDone = false;

  EngageDoc $doc;

  TaskModel(Map data) {
    map(data);
  }

  TaskModel.engage(EngageDoc doc) {
    $doc = doc;
    map($doc.$doc);
  }

  map(Map data) {
    name = data['name'];
    details = data['details'];
    dueAt = data['dueAt'];
    isDone = data['isDone'];
  }

  save() {
    $doc.$doc['name'] = name;
    $doc.$doc['details'] = details;
    $doc.$doc['dueAt'] = dueAt;
    $doc.$doc['isDone'] = isDone;
    $doc.$save();
  }

  Future toogleCheck() async { 
    isDone = !isDone;
    await save();
    return isDone;
  }
}