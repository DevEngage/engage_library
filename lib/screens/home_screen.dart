
import 'package:EarnIt/models/goal.dart';
import 'package:EarnIt/models/goal_model.dart';
import 'package:EarnIt/widgets/goal_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class tmp {
  List data = [];
}
class HomeScreen extends HookWidget {

  HomeScreen() {
    // Goal().getAll().then((val) => print(val.result));
  }

  // EngageFirestore goalsService = EngageFirestore.getInstance('users/{userId}/goals');

  @override
  Widget build(BuildContext context) {
    // final goals = useFuture(Backendless.data.withClass<Goal>().find());
    // Backendless.files.upload()
    // final goalsStream = useMemoized(() => goalsService.stream(wrapper: (doc) => GoalModel.fromFirestore(doc)));
    // final snapshot = useStream(goalsStream); //<List<GoalModel>>

    // final goals = useFuture(useMemoized(() => Goal().getAll()));
    // print(goals.data.result);
    
    // print(list);
    final snapshot = tmp();
    final results = useState<List>([]);
    print(results.value);
    final searchString = useState<String>('');

    void filterSearchResults(String query) async {
      searchString.value = query;
      if (query.length < 3) {
        results.value = snapshot.data;
        return;
      }
      print(snapshot.data);
      results.value = (snapshot.data ?? []).where((goal) => goal.name.toLowerCase().contains(query.toLowerCase()) == true).toList();
    }
    filterSearchResults(searchString.value);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
       backgroundColor: Colors.deepPurple, 
       child: Icon(Icons.add), 
       onPressed: () => Navigator.pushNamed(context, '/editGoals', arguments: <String, dynamic> { 'id': null }) // _addEditGoal(context, currentDate, goalCategory),
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
              onChanged: (value) => searchString.value = value,
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

        if (snapshot.data != null && snapshot.data.isNotEmpty) 
          ...(results.value ?? []).map((item) => GoalItem(goal: item,)).toList(),

        // GoalsAccordian(
        //   list: ['teet']
        // ),

        if (snapshot.data == null || snapshot.data.isEmpty) Row(children: <Widget>[
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