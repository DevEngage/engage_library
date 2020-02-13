

import 'package:EarnIt/models/task.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Goal extends ParseObject implements ParseCloneable {

  List<Task> tasks = [];

  Goal() : super(_keyTableName);
  Goal.clone(): this();

  /// Looks strangely hacky but due to Flutter not using reflection, we have to
  /// mimic a clone
  @override clone(Map map) => Goal.clone()..fromJson(map);

  static const String _keyTableName = 'Goal';
  static const String keyName = 'name';
  static const String keyReward = 'reward';
  static const String keyDetails = 'details';
  
  String get objectId => get<String>('objectId');
  set objectId(String name) => set<String>('objectId', name);
  
  String get name => get<String>(keyName);
  set name(String name) => set<String>(keyName, name);
  
  String get reward => get<String>(keyReward);
  set reward(String name) => set<String>(keyReward, name);
  
  String get details => get<String>(keyDetails);
  set details(String name) => set<String>(keyDetails, name);
  
  DateTime get dueAt => get<DateTime>('dueAt');
  set dueAt(DateTime name) => set<DateTime>('dueAt', name);
  
  String get category => get<String>('category');
  set category(String name) => set<String>('category', name);
  
  bool get isDone => get<bool>('isDone');
  set isDone(bool name) => set<bool>('isDone', name);

  String get owner => get<String>('owner');
  set owner(String name) => set<String>('owner', name);

  // List get tasks => get<List>('tasks');
  // set tasks(List name) => set<List>('tasks', name);

  Future getTask() async {
    ParseResponse response = await (get('tasks') as ParseRelation<ParseObject>).getQuery().query();
    if (response.success && response.results != null) {
      tasks = response.results; // .map((item) => Task().clone(item)).toList();
    }
    tasks = [];
    return tasks;
  }

  Future<List> getUserGoals() async {
    ParseUser user = await ParseUser.currentUser() as ParseUser;
    var queryBuilder = QueryBuilder<Goal>(Goal());
    queryBuilder.whereEqualTo('owner', user.objectId);
    // queryBuilder(['tasks']);
    ParseResponse response = await queryBuilder.query();
    if (response.success) {
      return response.result;
    }
    return [];
  }

  getUserGoalsHook() {
    return useFuture(useMemoized(() => getUserGoals()));
  }

  @override
  save() async {
    ParseUser user = await ParseUser.currentUser() as ParseUser;
    ParseACL parseACL = ParseACL(owner: user);
    owner = user.objectId;
    setACL(parseACL);
    return await super.save();
  }

  Future addTask(Task task) async {
    if (task.objectId != null) {
      await task.save();
      var tasksRelation = getRelation('tasks');
      tasksRelation.add(task);
      tasks.add(task);
    } else {
      await task.save();
    }
  }
}