
import 'package:EarnIt/models/goal.dart';
import 'package:EarnIt/widgets/goal_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {

  String searchString = '';

  List search(query, List list) {
    if (list.length < 3) return list;
    return list.where((goal) => goal.name.toLowerCase().contains(query.toLowerCase()) == true).toList();
  }
  s
  @override
  Widget build(BuildContext context) {
    final search = searchHook();/
    // final goalsRes = Goal().getUserGoalsHook();
    // final goalsList = useState<List>(goalsRes.data ?? []);
    // final results = useState<List>([]);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
       backgroundColor: Colors.deepPurple,
       child: Icon(Icons.add), 
       onPressed: () async {
          await Navigator.pushNamed(context, '/editGoals', arguments: <String, dynamic> { 'id': null }); // _addEditGoal(context, currentDate, goalCategory),
          // Goal().getUserGoals();
          goalsList.value = await Goal().getUserGoals();
          // filterSearchResults(searchString.value);
       }
     ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.withOpacity(0.5),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/imgs/background.png'))), // Image.asset('assets/imgs/background.png') ),
        child: ListView(children: <Widget>[
          Container(
          color: Colors.black38,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: TextFormField(
              onChanged: (value) { 
                searchString.value = value;
              },
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.white, letterSpacing: 1.2),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                focusColor: Colors.white,
                hintStyle:
                    Theme.of(context).textTheme.subhead.copyWith(color: Colors.white54),
                icon: Icon(
                  Icons.search,
                  color: Colors.greenAccent,
                ),
                contentPadding: EdgeInsets.zero,
              ),
              keyboardType: TextInputType.text,
            ),
          )
        ),

        if ((goalsRes.data != null && goalsRes.data.isNotEmpty))
          ...(search(searchString.value, goalsRes.data) ?? []).map((item) => GoalItem(goal: item,)).toList(),

        if (goalsRes.data == null || goalsRes.data.isEmpty) Row(children: <Widget>[
          Expanded(child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          // color: Colors.green,
          decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.65),
                      borderRadius: BorderRadius.all(
                          const Radius.circular(15.0))),
          child: Center(child: Text('You have no goals lined up. Add one!', style: TextStyle(fontSize: 18, color: Colors.black54),))
          ))]),
      ],))); // ListView.builder()
    }
}