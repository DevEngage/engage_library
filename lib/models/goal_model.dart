import 'package:engagefire/core/doc.dart';
import 'package:engagefire/core/firestore.dart';

/* 
  TODO:
  [ ] cache for not logged in
 */

class GoalModel {

  String $id = '';
  String name = '';
  int dueAt;
  String details = '';
  String reward = '';
  bool isDone = false;
  String category = '';

  EngageDoc $doc;

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
    $doc = EngageDoc.fromFirestore(doc);
    map($doc.$doc);
  }

  GoalModel.engage(EngageDoc doc) {
    $doc = doc;
     map($doc.$doc);
  }

  map(Map data) {
    $id = data['\$id'];
    name = data['name'];
    details = data['details'];
    reward = data['reward'];
    dueAt = data['dueAt'];
    isDone = data['isDone'];
    category = data['category'];
    // category = data['notify'];
  }

  Future createNew() async {
    $doc = await EngageFirestore.getInstance('goals').save({ //users/{userId}/
      'name': name,
      'details': details,
      'reward': reward,
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
    $doc.$doc['details'] = details;
    $doc.$doc['reward'] = reward;
    $doc.$doc['dueAt'] = dueAt;
    $doc.$doc['isDone'] = isDone;
    $doc.$doc['category'] = category;
    await $doc.$save();
  }

  toogleCheck() { 
    isDone = !isDone;
    save();
    return isDone;
  }

  cleanUp() {

  }

}