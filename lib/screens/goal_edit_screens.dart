import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:earn_it/controllers/goal_controller.dart';
import 'package:earn_it/models/goal_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GoalEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dynamic args = Get.arguments;
    GoalModel goal = args['goal'] ?? GoalModel();
    final _formKey = GlobalKey<FormState>();
    final dateFormat = DateFormat("MMM d, yyyy hh:mm a");

    return Scaffold(
        floatingActionButton: MaterialButton(
            color: Colors.deepPurple,
            padding: const EdgeInsets.all(12),
            child: Text('Save',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            onPressed: () async {
              print(goal);
              await goal.save();
              Get.back();
            }),
        appBar: AppBar(
          title: Text(goal.id != null ? 'Edit ' : 'Create ' + 'GoalModel'),
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
                        hintText: 'Name your goal',
                      ),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      initialValue: goal.name,
                      onChanged: (value) => goal.name = value,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'What is your reward?',
                      ),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      initialValue: goal.reward,
                      onChanged: (value) => goal.reward = value,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Details',
                      ),
                      initialValue: goal.details,
                      onChanged: (value) => goal.details = value,
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
                            Text('Due', style: TextStyle(fontSize: 18)),
                            DateTimeField(
                              initialValue: goal.getDueAt,
                              format: dateFormat,
                              onChanged: (DateTime? value) =>
                                  goal.setDueAt = value,
                              onShowPicker: (context, currentValue) async {
                                final date = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime(1900),
                                    initialDate: currentValue ?? DateTime.now(),
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
                                  style: TextStyle(color: Colors.grey.shade500),
                                ),
                                // underline: Container(
                                //   height: 2,
                                //   color: Colors.deepPurpleAccent,
                                // ),
                                value: goal.category,
                                onChanged: (dynamic newValue) {
                                  // goalState.value.category = newValue;
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
              ),
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
