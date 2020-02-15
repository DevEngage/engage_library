import 'package:parse_server_sdk/parse_server_sdk.dart';

class Task extends ParseObject implements ParseCloneable {
  Task() : super(_keyTableName);
  Task.clone() : this();

  /// Looks strangely hacky but due to Flutter not using reflection, we have to
  /// mimic a clone
  @override
  clone(Map map) => Task.clone()..fromJson(map);

  static const String _keyTableName = 'Task';

  String get objectId => get<String>('objectId');
  set objectId(String name) => set<String>('objectId', name);

  String get name => get<String>('name');
  set name(String name) => set<String>('name', name);

  String get details => get<String>('details');
  set details(String name) => set<String>('details', name);

  DateTime get dueAt => get<DateTime>('dueAt');
  set dueAt(DateTime name) => set<DateTime>('dueAt', name);

  String get category => get<String>('category');
  set category(String name) => set<String>('category', name);

  bool get isDone => get<bool>('isDone') ?? false;
  set isDone(bool name) => set<bool>('isDone', name);

  String get owner => get<String>('owner');
  set owner(String name) => set<String>('owner', name);

  List get tasks => get<List>('tasks');
  set tasks(List name) => set<List>('tasks', name);

  @override
  save() async {
    ParseUser user = await ParseUser.currentUser() as ParseUser;
    ParseACL parseACL = ParseACL(owner: user);
    owner = user.objectId;
    setACL(parseACL);
    return await super.save();
  }
}
