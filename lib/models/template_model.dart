import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earn_it/models/goal_model.dart';
import 'package:earn_it/models/task_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

/* 
  TODO:
  [ ] cache for not logged in
 */

enum TemplateType {
  user, // User generated
  system, // default templates
  store, // cost $
}

class TemplateModel {
  String? id;
  String name = '';
  String details = '';
  TemplateType type = TemplateType.system;
  String? owner;
  String? cost;
  List tags = [];
  List goals = [];
  int goalCount = 0;
  DateTime? createdAt;
  DateTime? updatedAt;
  CollectionReference<TemplateModel>? ref;
  CollectionReference<GoalModel>? refGoals;

  TemplateModel([Map? data]);

  TemplateModel.fromJson(Map data, String? _id) {
    id = _id;
    name = data['name'];
    details = data['details'] ?? '';
    type = data['type'] ?? TemplateType.system;
    tags = data['tags'] ?? [];
    owner = data['owner'];
    cost = data['cost'] ?? '0';
    if (data['createdAt'] != null)
      createdAt = DateTime.fromMillisecondsSinceEpoch(data['createdAt']);
    if (data['updatedAt'] != null)
      updatedAt = DateTime.fromMillisecondsSinceEpoch(data['updatedAt']);
    ref = FirebaseFirestore.instance
        .collection('templates')
        .withConverter<TemplateModel>(
          fromFirestore: (snapshot, _) =>
              TemplateModel.fromJson(snapshot.data()!, snapshot.id),
          toFirestore: (doc, _) => doc.toJson(),
        );
    refGoals = FirebaseFirestore.instance
        .collection('templates')
        .doc(id)
        .collection('goals')
        .withConverter<GoalModel>(
          fromFirestore: (snapshot, _) =>
              GoalModel.fromJson(snapshot.data()!, snapshot.id),
          toFirestore: (doc, _) => doc.toJson(),
        );
  }

  toJson() {
    return {
      '\$id': id,
      'name': name,
      'details': details,
      'owner': owner,
      'tags': tags,
      'type': type,
      'updatedAt': DateTime.now().millisecondsSinceEpoch,
      'createdAt': createdAt ?? DateTime.now().millisecondsSinceEpoch,
    };
  }

  save() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (owner == null) {
      owner = auth.currentUser?.uid;
    }
    try {
      if (id == null) {
        FirebaseFirestore.instance.collection('template').add(toJson());
      }
      return await ref?.doc(id).update({...toJson()});
    } catch (error) {
      print(error);
      return null;
    }
  }

  getGoals() async {
    goals = (await refGoals!.get()).docs.map((item) => item.data()).toList();
    return goals;
  }

  remove() async {
    var goals = await getGoals();
    var removedList = goals.map((item) async => await item.remove()).toList();
    await Future.wait(removedList);
    await ref?.doc(id).delete();
  }

  copyToUser([userId]) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    owner = auth.currentUser?.uid;
    var goals = await getGoals();
    var addList = goals.map((item) async => await item.copy()).toList();
    await Future.wait(addList);
    // switch (type) {
    //   case TemplateType.user:
    //     return;
    //   case TemplateType.system:
    //     return;
    //   case TemplateType.store:
    //     return;
    //   default:
    //     return;
    // }
  }

  get isFree {
    return cost == null || cost == '0' || cost == '0.00';
  }

  purchase() {
    if (cost == null) return;
  }
}
