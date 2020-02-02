// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:intl/intl.dart';

// class GoalEdit extends HookWidget {
//   final id;

//   GoalEdit({
//     this.id
//   });
  
//   @override
//   Widget build(BuildContext context) {
//     final currentDate = useState<DateTime>();
//     final goalCategory = useState<String>();
//     final _formKey = GlobalKey<FormState>();
//     final dateFormat = DateFormat("MMM d, yyyy hh:mm a");

//       List categories = [
//         {
//           "display": "Running",
//           "value": "Running",
//         },
//         {
//           "display": "Climbing",
//           "value": "Climbing",
//         },
//         {
//           "display": "Walking",
//           "value": "Walking",
//         },
        
//       ];

//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return SimpleDialog(
//             backgroundColor: Colors.white.withOpacity(0.8),
//             title: Row(children: <Widget>[
//               Row(children: <Widget>[ 
//                 Text(id != null ? 'Edit ' : 'Create ' + 'Goal'), 
//               ],),
//               Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
//                   // Column(children: <Widget>[
//                   //   Text('10', style: TextStyle(color: Colors.black87, fontSize: 16)),
//                   //   Text('tasks', style: TextStyle(color: Colors.black87, fontSize: 10)),
//                   // ],),
//                   // IconButton(icon: Icon(Icons.notifications_none), color: Colors.teal, onPressed: () => true,),
//                   // IconButton(icon: Icon(Icons.check_box_outline_blank), onPressed: () => true,),
//                 ],)),
//             ]),
//             children: <Widget>[
//               Container(
//                 padding: const EdgeInsets.all(16.0),
//                 child: 
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       TextFormField(
//                         decoration: const InputDecoration(
//                           hintText: 'Name your goal',
//                         ),
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'Please enter some text';
//                           }
//                           return null;
//                         },
//                       ),
//                       TextFormField(
//                         decoration: const InputDecoration(
//                           hintText: 'What is your reward?',
//                         ),
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'Please enter some text';
//                           }
//                           return null;
//                         },
//                       ),

//                       TextFormField(
//                         decoration: const InputDecoration(
//                           hintText: 'Details',
//                         ),
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'Please enter some text';
//                           }
//                           return null;
//                         },
//                       ),

//                       Container(
//                         padding: const EdgeInsets.only(top: 16.0),
//                         child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text('Due'),
//                           DateTimeField(
//                             initialValue: currentDate.value,
//                             format: dateFormat,
//                             onShowPicker: (context, currentValue) async {
//                               final date = await showDatePicker(
//                                   context: context,
//                                   firstDate: DateTime(1900),
//                                   initialDate: currentValue ?? DateTime.now(),
//                                   lastDate: DateTime(2100));
//                               if (date != null) {
//                                 final time = await showTimePicker(
//                                   context: context,
//                                   initialTime:
//                                       TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
//                                 );
//                                 return DateTimeField.combine(date, time);
//                               } else {
//                                 return currentValue;
//                               }
//                             },
//                           ),
//                       ]),),

//                       DropdownButtonHideUnderline(
//                         child: DropdownButton<dynamic>(
//                           hint: Text(
//                             'Please choose a category',
//                             style: TextStyle(color: Colors.grey.shade500),
//                           ),
//                           value: goalCategory.value,
//                           onChanged: (dynamic newValue) {
//                             goalCategory.value = newValue;
//                           },
//                           items: categories.map((item) {
//                             return DropdownMenuItem<dynamic>(
//                               value: item['value'],
//                               child: Text(item['display']),
//                             );
//                           }).toList(),
//                         ),
//                       ),

                      
//                     ],
//                   ),
//                 )
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal:  16.0, vertical: 4),
//                 child: 
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                     FlatButton(child: Text('Cancel', style: 
//                       TextStyle(color: Colors.black38)), onPressed: () => Navigator.pop(context, false),),
//                     FlatButton(child: Text('Save', style: 
//                       TextStyle(color: Colors.deepPurple),), onPressed: () {
//                         Navigator.pop(context, true);
//                         print(_formKey.currentState);
//                         print(_formKey.currentState);
//                       },),
//                   ],)
//               ),
              
//             ],
//           );
//         }
//     );
//   return Text('test');
//   }
// }

// ValueNotifier<T> useLoggedState<T>(BuildContext context, [T initialData]) {
//   final result = useState<T>(initialData);
//   useValueChanged(result.value, (_, __) {
//     print(result.value);
//   });
//   return result;
// }