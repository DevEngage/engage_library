import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:earn_it/controllers/goal_controller.dart';
import 'package:earn_it/controllers/template_controller.dart';
import 'package:earn_it/models/goal_model.dart';
import 'package:earn_it/models/template_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TemplateEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dynamic args = Get.arguments;
    final goalController = GoalController.to;
    final templateController = TemplateController.to;
    TemplateModel template = templateController.templateEdit!;
    final _formKey = GlobalKey<FormState>();
    final dateFormat = DateFormat("MMM d, yyyy hh:mm a");

    return Scaffold(
        floatingActionButton: MaterialButton(
            color: Colors.deepPurple,
            padding: const EdgeInsets.all(12),
            child: Text('Save',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            onPressed: () async {
              await template.save();
              templateController.templateEdit = null;
              Get.back();
            }),
        appBar: AppBar(
          title: Text(template.id != null ? 'Edit ' : 'Create ' + 'Template'),
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
                        hintText: 'Name your template',
                      ),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      initialValue: template.name,
                      onChanged: (value) => template.name = value,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'What is the cost?',
                      ),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      initialValue: template.cost,
                      onChanged: (value) => template.cost = value,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Details',
                      ),
                      initialValue: template.details,
                      onChanged: (value) => template.details = value,
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     return 'Please enter some text';
                      //   }
                      //   return null;
                      // },
                    ),
                    // Container(
                    //   padding: const EdgeInsets.only(top: 16.0),
                    //   child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: <Widget>[
                    //         // Text('Due', style: TextStyle(fontSize: 18)),
                    //         DateTimeField(
                    //           decoration: const InputDecoration(
                    //             hintText: 'Due',
                    //           ),
                    //           initialValue: goal.getDueAt,
                    //           format: dateFormat,
                    //           onChanged: (DateTime? value) =>
                    //               goal.setDueAt = value,
                    //           onShowPicker: (context, currentValue) async {
                    //             final date = await showDatePicker(
                    //                 context: context,
                    //                 firstDate: DateTime(1900),
                    //                 initialDate: currentValue ?? DateTime.now(),
                    //                 lastDate: DateTime(2100));
                    //             if (date != null) {
                    //               final time = await showTimePicker(
                    //                 context: context,
                    //                 initialTime: TimeOfDay.fromDateTime(
                    //                     currentValue ?? DateTime.now()),
                    //               );
                    //               return DateTimeField.combine(date, time);
                    //             } else {
                    //               return currentValue;
                    //             }
                    //           },
                    //         ),
                    //       ]),
                    // ),
                    // GetBuilder<GoalController>(
                    //   builder: (_) => Container(
                    //     padding: const EdgeInsets.only(top: 24.0),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: <Widget>[
                    //         Text('Category', style: TextStyle(fontSize: 18)),
                    //         DropdownButtonHideUnderline(
                    //           child: DropdownButton<dynamic>(
                    //             hint: Text(
                    //               'Please choose a category',
                    //               style: TextStyle(color: Colors.grey.shade500),
                    //             ),
                    //             // underline: Container(
                    //             //   height: 2,
                    //             //   color: Colors.deepPurpleAccent,
                    //             // ),
                    //             value: template.category,
                    //             onChanged: (dynamic newValue) {
                    //               template.category = newValue;
                    //               goalController.update();
                    //             },
                    //             items: GoalController.categories.map((item) {
                    //               return DropdownMenuItem<String>(
                    //                 value: item,
                    //                 child: Text(item),
                    //               );
                    //             }).toList(),
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    GetBuilder<GoalController>(
                      builder: (_) => Container(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Type', style: TextStyle(fontSize: 18)),
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
                                value: template.type,
                                onChanged: (dynamic newValue) {
                                  template.type = newValue;
                                  goalController.update();
                                },
                                items: [
                                  TemplateType.store,
                                  TemplateType.user,
                                  TemplateType.system
                                ].map((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(item.toString()),
                                  );
                                }).toList(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
