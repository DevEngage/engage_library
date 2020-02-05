import 'package:EarnIt/models/goal_model.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class GoalEdit extends HookWidget {
  final id;
  GoalModel goal;

  GoalEdit({
    this.id,
    this.goal,
  }) {
    if (id == null) {
      goal = GoalModel();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final dateFormat = DateFormat("MMM d, yyyy hh:mm a");

    final goalState = useState<GoalModel>(goal);
    final currentDate = useState<DateTime>();
    final goalCategory = useState<String>();

    List categories = [
      {
        "display": "Food",
        "value": "Food",
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

    return Scaffold(
      floatingActionButton: MaterialButton(
        color: Colors.deepPurple, 
        padding: const EdgeInsets.all(12),
        child: Text('Save', style: TextStyle(color: Colors.white, fontSize: 20)), 
        onPressed: () async {
          // Navigator.pushNamed(context, '/editGoals', arguments: <String, dynamic> { 'id': null }) // _addEditGoal(context, currentDate, goalCategory),
          await goal.save();
          Navigator.pop(context);
        }
      ),
      appBar: AppBar(
       title: Text(id != null ? 'Edit ' : 'Create ' + 'Goal'),
      ),
      body: Column(children: <Widget>[
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
                onChanged: (value) => goalState.value.name = value,
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
                onChanged: (value) => goalState.value.reward = value,
              ),

              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Details',
                ),
                onChanged: (value) => goalState.value.details = value,
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'Please enter some text';
                //   }
                //   return null;
                // },
              ),

              Container(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Due', style: TextStyle( fontSize: 18)),
                  DateTimeField(
                    initialValue: currentDate.value,
                    format: dateFormat,
                    onChanged: (DateTime value) => goalState.value.dueAt = value.millisecondsSinceEpoch,
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

              Container(padding: const EdgeInsets.only(top: 24.0), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[ 
                Text('Category', style: TextStyle( fontSize: 18)),
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
                    goalState.value.category = newValue;
                  },
                  items: categories.map((item) {
                    return DropdownMenuItem<dynamic>(
                      value: item['value'],
                      child: Text(item['display']),
                    );
                  }).toList(),
                ),
              )],)),

              
            ],
          ),
        )
      ),
      // Container(
      //   padding: const EdgeInsets.symmetric(horizontal:  16.0, vertical: 4),
      //   child: 
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       children: <Widget>[
      //       FlatButton(child: Text('Cancel', style: 
      //         TextStyle(color: Colors.black38)), onPressed: () => Navigator.pop(context, false),),
      //       FlatButton(child: Text('Save', style: 
      //         TextStyle(color: Colors.deepPurple),), onPressed: () {
      //           Navigator.pop(context, true);
      //           print(_formKey.currentState);
      //           print(_formKey.currentState);
      //         },),
      //     ],)
      // ),

    ],));
  }
}

ValueNotifier<T> useLoggedState<T>(BuildContext context, [T initialData]) {
  final result = useState<T>(initialData);
  useValueChanged(result.value, (_, __) {
    print(result.value);
  });
  return result;
}