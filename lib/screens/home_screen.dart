
import 'package:EarnIt/widgets/goal_item.dart';
import 'package:EarnIt/widgets/task_item.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class HomeScreen extends HookWidget {

  @override
  Widget build(BuildContext context) {

    final results = useState<List>([]);
    final currentDate = useState<DateTime>();
    final goalCategory = useState<String>();

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
              onChanged: (value) => filterSearchResults(value),
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

        if (results.value.isEmpty) ...[
          GoalItem(),
        ],

        if (results.value.isEmpty) Row(children: <Widget>[
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

    Future<void> _addEditGoal(context, currentDate, goalCategory, [id]) async {
      final _formKey = GlobalKey<FormState>();
      final dateFormat = DateFormat("MMM d, yyyy hh:mm a");

      List categories = [
        {
          "display": "Running",
          "value": "Running",
        },
        {
          "display": "Climbing",
          "value": "Climbing",
        },
        {
          "display": "Walking",
          "value": "Walking",
        },
        
      ];

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
                          hintText: 'Details',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),

                      Container(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Due'),
                          DateTimeField(
                            initialValue: currentDate.value,
                            format: dateFormat,
                            onShowPicker: (context, currentValue) async {
                              final date = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(2100));
                              if (date != null) {
                                final time = await showTimePicker(
                                  context: context,
                                  initialTime:
                                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                                );
                                return DateTimeField.combine(date, time);
                              } else {
                                return currentValue;
                              }
                            },
                          ),
                      ]),),

                      DropdownButtonHideUnderline(
                        child: DropdownButton<dynamic>(
                          hint: Text(
                            'Please choose a category',
                            style: TextStyle(color: Colors.grey.shade500),
                          ),
                          // underline: Container(
                          //   height: 2,
                          //   color: Colors.deepPurpleAccent,
                          // ),
                          value: goalCategory.value,
                          onChanged: (dynamic newValue) {
                            goalCategory.value = newValue;
                          },
                          items: categories.map((item) {
                            return DropdownMenuItem<dynamic>(
                              value: item['value'],
                              child: Text(item['display']),
                            );
                          }).toList(),
                        ),
                      ),

                      
                    ],
                  ),
                )
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal:  16.0, vertical: 4),
                child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                    FlatButton(child: Text('Cancel', style: 
                      TextStyle(color: Colors.black38)), onPressed: () => Navigator.pop(context, false),),
                    FlatButton(child: Text('Save', style: 
                      TextStyle(color: Colors.deepPurple),), onPressed: () {
                        Navigator.pop(context, true);
                        print(_formKey.currentState);
                        print(_formKey.currentState);
                      },),
                  ],)
              ),
              
            ],
          );
        }
    );
  }

}