import 'package:EarnIt/widgets/goal_item.dart';
import 'package:EarnIt/widgets/task_item.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class GoalScreen extends HookWidget {
  final id;

  GoalScreen({
    this.id
  });
  
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final dateFormat = DateFormat("MMM d, yyyy hh:mm a");

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple, 
        child: Icon(Icons.add), 
        onPressed: () => Navigator.pushNamed(context, '/editTask', arguments: <String, dynamic> { 'id': null }) // _addEditGoal(context, currentDate, goalCategory),
      ),
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        // leading: Text('Reward: Food'),
        // title: Text('Goal Name'),
        bottom: PreferredSize(preferredSize: Size.fromHeight(60), 
          child: Column(children: <Widget>[
            Text('Reward: test'),
            Text('details here')
          ],)
        )
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.withOpacity(0.5),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/imgs/mountain_medium.jpg'), colorFilter: ColorFilter.mode(Colors.black45, BlendMode.srcOver))), // Image.asset('assets/imgs/background.png') ),
        child: ListView(children: <Widget>[
        // GoalItem(),
        Container(child: Text('')),
        TaskItem(),
        // TaskItem(),
        // TaskItem(),
        // TaskItem(),
        // TaskItem(),
        // TaskItem(),
        // TaskItem(),
        // TaskItem(),
        // TaskItem(),

      ],)));
  }
}

ValueNotifier<T> useLoggedState<T>(BuildContext context, [T initialData]) {
  final result = useState<T>(initialData);
  useValueChanged(result.value, (_, __) {
    print(result.value);
  });
  return result;
}