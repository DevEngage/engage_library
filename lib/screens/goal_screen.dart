import 'package:EarnIt/models/goal.dart';
import 'package:EarnIt/widgets/task_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class GoalScreen extends HookWidget {
  final id;
  // final GoalModel goal;

  GoalScreen({
    this.id,
    // this.goal,
  });
  
  @override
  Widget build(BuildContext context) {
    final dynamic args = ModalRoute.of(context).settings.arguments;
    Goal goal = args['goal'];
    // goal = EngageFirestore.getInstanceItem('goals', id);
    final _formKey = GlobalKey<FormState>();
    final dateFormat = DateFormat("MMM d, yyyy hh:mm a");

    final currentDate = useState<DateTime>();
    final goalCategory = useState<String>();

    // final tasks = goal.tasksHook();


    if (goal == null) return Text('Loading...');
    // print(tasks);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple, 
        child: Icon(Icons.add), 
        onPressed: () => Navigator.pushNamed(context, '/editTask', arguments: <String, dynamic> { 'id': null, 'goal': goal }) // _addEditGoal(context, currentDate, goalCategory),
      ),
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          Text(goal.name),

          IconButton(icon: Icon(Icons.edit), onPressed: () => true,),
          //Text('Reward: '), 
        ],)
        // leading: Text('Reward: Food'),
        // title: Text('Goal Name'),
        // bottom: PreferredSize(preferredSize: Size.fromHeight(30), 
        //   child: Container(
        //     padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 76),
        //     child: Row(children: <Widget>[
        //       Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        //         // Text('Reward: ${goal.reward}'),
        //         Wrap(children: <Widget>[ Text('Reward: '), Text(goal.reward, style: TextStyle(color: Colors.yellowAccent),)],),
        //         Text(goal.details),
        //       ],)
        //     ],)
        //   )
        // )
      ),
      body: Container( 
        decoration: BoxDecoration(
          color: Colors.deepPurple.withOpacity(0.5),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/imgs/mountain_medium.jpg'), colorFilter: ColorFilter.mode(Colors.black45, BlendMode.srcOver))), // Image.asset('assets/imgs/background.png') ),
        child: ListView(children: <Widget>[
        // GoalItem(),
        if (goal.reward != null)
          Container(
            color: Colors.white60,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(children: <Widget>[
              Wrap(children: <Widget>[ Text('Reward: ', style: TextStyle(fontSize: 18)), Text(goal.reward, style: TextStyle(color: Colors.yellowAccent, fontSize: 18),)],), 
          ],),),
        if (goal.dueAt != null)
          Container(
            color: Colors.white60,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(children: <Widget>[
              Wrap(children: <Widget>[ Text('Due: ${goal.dueAt}', style: TextStyle(),)],), 
          ],),),
        if (goal.details != null && goal.details != '')
          Container(
            color: Colors.white60,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(children: <Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                // Text('Reward: ${goal.reward}'),
                
                Text('Details: ${goal.details}'),
              ],)
            ],)
          ),
        Container(child: Text('')),
        // ...tasks.map((task) => TaskItem(task: task)),
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
