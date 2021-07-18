// import 'package:engagefire/core/doc.dart';
// import 'package:engagefire/mobile.dart';

class TaskModel {
  String? id;
  String? name;
  String? details;
  String? category;
  String? owner;
  int? dueAt;
  bool isDone = false;

  TaskModel();

  TaskModel.blank();

  TaskModel.fromJson(Map data) {
    id = data['\$id'];
    name = data['name'];
    details = data['details'];
    dueAt = data['dueAt'];
    isDone = data['isDone'] ?? false;
    details = data['details'];
  }

  toJson() {
    return {
      'id': id,
      'name': name,
      'details': details,
      'dueAt': dueAt,
      'isDone': isDone,
      'category': category,
    };
  }
}
