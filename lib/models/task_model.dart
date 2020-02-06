import 'package:engagefire/core/doc.dart';
import 'package:engagefire/mobile.dart';

class TaskModel {
  String $id;
  String name;
  String details;
  String category;
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

  TaskModel.blank();

  map(Map data) {
    $id = data['\$id'];
    name = data['name'];
    details = data['details'];
    dueAt = data['dueAt'];
    isDone = data['isDone'];
    category = data['category'];
  }

  Future createNew() async {
    $doc = await EngageFirestore.getInstance('goals').save({ //users/{userId}/
      'name': name,
      'details': details,
      'dueAt': dueAt,
      'isDone': isDone,
      'category': category,
    });
    map($doc.$doc);
  }

  Future save() async {
    if ($doc == null) {
      await createNew();
      return;
    }
    $doc.$doc['\$id'] = $id;
    $doc.$doc['name'] = name;
    $doc.$doc['details'] = details;
    $doc.$doc['dueAt'] = dueAt;
    $doc.$doc['isDone'] = isDone;
    $doc.$doc['categorys'] = category;
    $doc.$save();
  }

  Future toogleCheck() async { 
    isDone = !isDone;
    await save();
    return isDone;
  }
}