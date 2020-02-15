import 'package:EarnIt/models/task.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Goal extends ParseObject implements ParseCloneable {
  List<Task> tasks = [];

  Goal() : super(_keyTableName);
  Goal.clone() : this();

  /// Looks strangely hacky but due to Flutter not using reflection, we have to
  /// mimic a clone
  @override
  clone(Map map) => Goal.clone()..fromJson(map);

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

  bool get isDone => get<bool>('isDone') ?? false;
  set isDone(bool name) => set<bool>('isDone', name);

  int get taskCount => get<int>('taskCount') ?? 0;
  set taskCount(int name) => set<int>('taskCount', name);

  String get owner => get<String>('owner');
  set owner(String name) => set<String>('owner', name);

  // List get tasks => get<List>('tasks');
  // set tasks(List name) => set<List>('tasks', name);

  Future<List<Task>> getTask() async {
    QueryBuilder<Task> query = QueryBuilder<Task>(Task())
      ..whereRelatedTo('tasks', 'Goal', objectId);
    ParseResponse response = await query.query();
    if (response.success) {
      // print(response.results);
      tasks = (response.results ?? []).cast<Task>();
    } else {
      tasks = [];
    }
    return tasks;
  }

  Future<List<Goal>> getUserGoals() async {
    try {
      ParseUser user = await ParseUser.currentUser() as ParseUser;
      var queryBuilder = QueryBuilder<Goal>(Goal());
      queryBuilder.whereEqualTo('owner', user.objectId);
      // queryBuilder(['tasks']);
      ParseResponse response = await queryBuilder.query();
      print(response.success);
      if (response.success) {
        return (response.results ?? []).cast<Goal>();
      }
    } catch (error) {
      print(error);
    }
    return [];
  }

  // getUserGoalsHook() {
  //   return useFuture(useMemoized(() => getUserGoals()));
  // }

  @override
  save() async {
    ParseUser user = await ParseUser.currentUser() as ParseUser;
    ParseACL parseACL = ParseACL(owner: user);
    owner = user.objectId;
    setACL(parseACL);
    return await super.save();
  }

  Future addTask(Task task) async {
    if (task.objectId == null) {
      await task.save();
      var tasksRelation = getRelation('tasks');
      // addRelation('fruits', [ParseObject("Fruits")..set("objectId", "XGadzYxnac")]);
      tasksRelation.add(task);
      tasks.add(task);
      setIncrement('taskCount', 1);
      save();
    } else {
      await task.save();
    }
  }

  Future deleteTask(Task task) async {
    var tasksRelation = getRelation('tasks');
    tasksRelation.remove(task);
    await task.delete();
    tasks.remove(task);
    setDecrement('taskCount', 1);
    await save();
  }

  Future toggleTask(Task task) async {
    task.toggleIsDone();
    isDone = tasks.every((value) => value.isDone == true) && taskCount != 0;
    save();
  }
}
