import 'package:EarnIt/models/goal.dart';
import 'package:flutter/material.dart';

class Goals with ChangeNotifier {
  List<Goal> goals = [];
  List<Goal> searched = [];
  String lastQuery;

  search([query]) {
    lastQuery ??= query;
    if (goals.length < 3) searched = goals;
    searched = goals
        .where((goal) =>
            goal.name.toLowerCase().contains(lastQuery.toLowerCase()) == true)
        .toList();
    notifyListeners();
  }

  getList() async {
    goals = await Goal().getUserGoals();
    if (lastQuery != null) {
      search();
    } else {
      notifyListeners();
    }
  }
}
