import 'package:EarnIt/models/goal.dart';
import 'package:EarnIt/models/task.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Goals with ChangeNotifier {
  List<Goal> goals = [];
  List<Goal> searched = [];
  String lastQuery;

  Goals() {
    getList();
  }

  search([String query]) {
    lastQuery = query ?? lastQuery;
    if (lastQuery.length < 3) searched = goals;
    searched = goals
        .where((goal) =>
            goal.name.toLowerCase().contains(lastQuery.toLowerCase()) == true)
        .toList();
    notifyListeners();
  }

  Future getList() async {
    goals = await Goal().getUserGoals();
    if (lastQuery != null) {
      search();
    } else {
      notifyListeners();
    }
  }

  refreshTasks(Goal goal) async {
    await goal.getTask();
    notifyListeners();
  }

  refresh() {
    notifyListeners();
  }

  removeTask(Goal goal, Task task) async {
    await goal.deleteTask(task);
    notifyListeners();
  }

  removeGoal(Goal goal) async {
    await goal.delete();
    goals.remove(goal);
    searched.remove(goal);
    notifyListeners();
  }

  Future toggleTask(Goal goal, Task task) async {
    await goal.toggleTask(task);
    notifyListeners();
  }

  List<Goal> get list =>
      searched.isEmpty && lastQuery == null ? goals : searched;
}
