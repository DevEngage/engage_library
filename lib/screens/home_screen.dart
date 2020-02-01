
import 'package:EarnIt/widgets/goal_item.dart';
import 'package:EarnIt/widgets/task_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {

  @override
  Widget build(BuildContext context) {

    final results = useState<List>([]);

    void filterSearchResults(String query) async {
      List list = [];
      if (query.length < 3) {
        results.value = [];
        return;
      }
      // try {
      //   list = await ExerciseSearchModel.getState().search(query, replace: false);
      // } catch (e) {
      //   print("Exception when calling DefaultApi->analyzeARecipeSearchQuery: $e\n");
      // }
      results.value = list;
    }



    return Scaffold(
      floatingActionButton: FloatingActionButton(
       backgroundColor: Colors.deepPurple, 
       child: Icon(Icons.add), 
       onPressed: () => _addEditGoal(context),
     ),
      body: Container(
        decoration: new BoxDecoration(
          color: Colors.deepPurple.withOpacity(0.5),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/imgs/background.png'))), // Image.asset('assets/imgs/background.png') ),
        child: ListView(children: <Widget>[
        Container(
          color: Colors.black38,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: TextFormField(
              onChanged: (value) => filterSearchResults(value),
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.white, letterSpacing: 1.2),
              decoration: new InputDecoration(
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

        if (results.value.isEmpty) ...[
          GoalItem(),
        ],

        if (results.value.isEmpty) Row(children: <Widget>[
          Expanded(child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          // color: Colors.green,
          decoration: new BoxDecoration(
                      color: Colors.white.withOpacity(0.65),
                      borderRadius: new BorderRadius.all(
                          const Radius.circular(15.0))),
          child: Text('You have no goals lined up. Add one!', style: TextStyle(fontSize: 18, color: Colors.black54),)
          ))]),
      ],))); // ListView.builder()
    }

    Future<void> _addEditGoal(context, [id]) async {
      final _formKey = GlobalKey<FormState>();
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Colors.white.withOpacity(0.8),
            title: Row(children: <Widget>[
              Row(children: <Widget>[ 
                Text(id != null ? 'Edit ' : 'Create ' + 'Goal'), 
              ],),
              Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                  // Column(children: <Widget>[
                  //   Text('10', style: TextStyle(color: Colors.black87, fontSize: 16)),
                  //   Text('tasks', style: TextStyle(color: Colors.black87, fontSize: 10)),
                  // ],),
                  // IconButton(icon: Icon(Icons.notifications_none), color: Colors.teal, onPressed: () => true,),
                  // IconButton(icon: Icon(Icons.check_box_outline_blank), onPressed: () => true,),
                ],)),
            ]),
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16.0),
                child: 
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Name your goal',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'What is your reward?',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Due',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Details',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Category',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 16.0),
                      //   child: RaisedButton(
                      //     onPressed: () {
                      //       // Validate will return true if the form is valid, or false if
                      //       // the form is invalid.
                      //       if (_formKey.currentState.validate()) {
                      //         // Process data.
                      //       }
                      //     },
                      //     child: Text('Submit'),
                      //   ),
                      // ),
                    ],
                  ),
                )
              )
            ],
          );
        }
    );
  }

}