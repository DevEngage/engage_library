import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:earn_it/controllers/goal_controller.dart';
import 'package:earn_it/models/goal_model.dart';
import 'package:earn_it/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TaskEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dynamic args = Get.arguments;
    GoalModel goal = args['goal'];
    TaskModel task = args['task'] ?? TaskModel();
    final _formKey = GlobalKey<FormState>();
    final dateFormat = DateFormat("MMM d, yyyy hh:mm a");
    return Scaffold(
        floatingActionButton: MaterialButton(
            color: Colors.deepPurple,
            padding: const EdgeInsets.all(12),
            child: Text('Save',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            onPressed: () {
              goal.addTask(task);
              // Navigator.pop(context);
              Get.back();
            }),
        appBar: AppBar(
          title: Text(task.id != null ? 'Edit ' : 'Create ' + 'Task'),
        ),
        body: Column(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Name your task',
                        ),
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        initialValue: task.name,
                        onChanged: (value) => task.name = value,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Details',
                        ),
                        initialValue: task.details,
                        onChanged: (value) => task.details = value,
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
                              // Text('Due', style: TextStyle(fontSize: 18)),
                              DateTimeField(
                                initialValue: task.getDueAt,
                                decoration: const InputDecoration(
                                  hintText: 'Due',
                                ),
                                format: dateFormat,
                                onChanged: (DateTime? value) =>
                                    task.setDueAt = value,
                                onShowPicker: (context, currentValue) async {
                                  final date = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1900),
                                      initialDate:
                                          currentValue ?? DateTime.now(),
                                      lastDate: DateTime(2100));
                                  if (date != null) {
                                    final time = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.fromDateTime(
                                          currentValue ?? DateTime.now()),
                                    );
                                    return DateTimeField.combine(date, time);
                                  } else {
                                    return currentValue;
                                  }
                                },
                              ),
                            ]),
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Category', style: TextStyle(fontSize: 18)),
                              DropdownButtonHideUnderline(
                                child: DropdownButton<dynamic>(
                                  hint: Text(
                                    'Please choose a category',
                                    style:
                                        TextStyle(color: Colors.grey.shade500),
                                  ),
                                  // underline: Container(
                                  //   height: 2,
                                  //   color: Colors.deepPurpleAccent,
                                  // ),
                                  value: task.category,
                                  onChanged: (dynamic newValue) {
                                    task.category = newValue;
                                  },
                                  items: GoalController.categories.map((item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                )),
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
          ],
        ));
  }
}

// ValueNotifier<T> useLoggedState<T>(BuildContext context, [T initialData]) {
//   final result = useState<T>(initialData);
//   useValueChanged(result.value, (_, __) {
//     print(result.value);
//   });
//   return result;
// }
