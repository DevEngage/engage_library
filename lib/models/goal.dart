

import 'package:parse_server_sdk/parse_server_sdk.dart';

class Goal extends ParseObject implements ParseCloneable {
  List tasks;

  Goal() : super(_keyTableName);
  Goal.clone(): this();

  /// Looks strangely hacky but due to Flutter not using reflection, we have to
  /// mimic a clone
  @override clone(Map map) => Goal.clone()..fromJson(map);

  static const String _keyTableName = 'Goal';
  static const String keyName = 'Name';
  
  String get name => get<String>(keyName);
  set name(String name) => set<String>(keyName, name);
}