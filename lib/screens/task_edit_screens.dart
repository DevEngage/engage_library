import 'package:EarnIt/models/goal.dart';
import 'package:EarnIt/models/task.dart';
import 'package:EarnIt/models/task_model.dart';
import 'package:EarnIt/services/goals_services.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class TaskEdit extends HookWidget {
  final id;

  TaskEdit({
    this.id
  });
  
  @override
  Widget build(BuildContext context) {
    final dynamic args = ModalRoute.of(context).settings.arguments;
    Goal goal = args['goal'];
    Task task = args['task'] ?? Task();
    final _formKey = GlobalKey<FormState>();
    final dateFormat = DateFormat("MMM d, yyyy hh:mm a");

    final currentDate = useState<DateTime>();
    final goalCategory = useState<String>();

    final taskState = useState<Task>(task);

    return Scaffold(
      floatingActionButton: MaterialButton(
        color: Colors.deepPurple, 
        padding: const EdgeInsets.all(12),
        child: Text('Save', style: TextStyle(color: Colors.white, fontSize: 20)), 
        onPressed: () {
          goal.addTask(taskState.value);
          Navigator.pop(context);
          // Navigator.pushNamed(context, '/editGoals', arguments: <String, dynamic> { 'id': null }) // _addEditGoal(context, currentDate, goalCategory),
        }
      ),
      appBar: AppBar(
       title: Text(id != null ? 'Edit ' : 'Create ' + 'Task'),
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
                  hintText: 'Name your task',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onChanged: (value) => taskState.value.name = value,
              ),

              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Details',
                ),
                onChanged: (value) => taskState.value.details = value,
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
                    onChanged: (DateTime value) => taskState.value.dueAt = value,
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
                    taskState.value.category = newValue;
                  },
                  items: GoalsService.categories.map((item) {
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