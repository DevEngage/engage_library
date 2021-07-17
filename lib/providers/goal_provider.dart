import 'package:earn_it/models/goal.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Goals with ChangeNotifier {
  List<Goal> goals = [];
  List<Goal> searched = [];
  String lastQuery;
  int goalsCompleted = 0;
  int tasksCompleted = 0;

  Goals() {
    getList();
    getCount();
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
    await getCount();
    notifyListeners();
  }

  getCount() async {
    goalsCompleted = goals.where((val) => val.isDone == true).length;
    ParseUser user = await ParseUser.currentUser() as ParseUser;
    QueryBuilder<Task> query = QueryBuilder<Task>(Task())
      ..whereEqualTo('owner', user.objectId)
      ..whereEqualTo('isDone', true);
    var results = await query.count();
    tasksCompleted = results.success ? results.count : 0;

    // query.
    // taskssCompleted = goals.
    // });
  }

  List<Goal> get list =>
      searched.isEmpty && lastQuery == null ? goals : searched;
}
