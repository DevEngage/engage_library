
import 'package:engagefire/core/doc.dart';

/* 
  TODO:
  [ ] cache for not logged in

 */

class GoalModal extends EngageDoc {

  String name;
  int dueAt;
  String details;
  String reward;
  bool isfinished = false;
  String category;

  addTask({name, dueAt, details, }) {
    $getSub('tasks').add({
      'name': name,
      'dueAt': dueAt,
      'details': details,
    });
  }

}