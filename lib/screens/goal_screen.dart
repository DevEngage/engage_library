import 'package:EarnIt/models/goal.dart';
import 'package:EarnIt/providers/goal_provider.dart';
import 'package:EarnIt/widgets/confirm_widget.dart';
import 'package:EarnIt/widgets/task_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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

    if (goal == null) return Text('Loading...');
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            child: Icon(Icons.add),
            onPressed: () async {
              await Navigator.pushNamed(context, '/editTask',
                  arguments: <String, dynamic>{'id': null, 'goal': goal});
              Provider.of<Goals>(context, listen: false).refreshTasks(goal);
            }),
        appBar: AppBar(
          elevation: 0,
          title: Text(goal.name),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () async {
                await _showOptions(context, goal);
              },
            ),
          ],
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
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/imgs/mountain_medium.jpg'),
                    colorFilter: ColorFilter.mode(
                        Colors.black45,
                        BlendMode
                            .srcOver))), // Image.asset('assets/imgs/background.png') ),
            child: Consumer<Goals>(
                builder: (context, model, _) => ListView(
                      children: <Widget>[
                        // GoalItem(),
                        if (goal.reward != null)
                          Container(
                            color: Colors.black26,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Row(
                              children: <Widget>[
                                Wrap(
                                  children: <Widget>[
                                    Text('Reward: ',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white)),
                                    Text(
                                      goal.reward,
                                      style: TextStyle(
                                          color: Colors.yellowAccent,
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        if (goal.dueAt != null)
                          Container(
                            color: Colors.white60,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Row(
                              children: <Widget>[
                                Wrap(
                                  children: <Widget>[
                                    Text(
                                      'Due: ${goal.dueAt}',
                                      style: TextStyle(),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        if (goal.details != null && goal.details != '')
                          Container(
                              color: Colors.white60,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Row(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // Text('Reward: ${goal.reward}'),

                                      Text('Details: ${goal.details}'),
                                    ],
                                  )
                                ],
                              )),
                        Container(child: Text('')),
                        ...goal.tasks
                            .map((task) => TaskItem(task: task, goal: goal)),
                      ],
                    ))));
  }

  _showOptions(context, goal) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                // ListTile(
                //   title: Text(
                //     'Mark Done',
                //     style: TextStyle(color: Colors.black),
                //   ),
                //   leading: Icon(
                //     Icons.check,
                //     color: Colors.black,
                //   ),
                //   onTap: () {
                //     print('test');
                //     Navigator.pop(context);
                //   },
                // ),
                ListTile(
                  title: Text(
                    'Edit',
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  onTap: () async {
                    await Navigator.pushNamed(context, '/editGoal',
                        arguments: <String, dynamic>{
                          'id': null,
                          'goal': goal,
                        });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(
                    'Delete',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  leading: Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                  onTap: () async {
                    confirmWidget(context,
                        title: 'Delete Goal',
                        message: 'Warning you are about to delete this goal',
                        onAgreed: () async {
                      await Provider.of<Goals>(context, listen: false)
                          .removeGoal(goal);
                      Navigator.pop(context);
                    });
                  },
                ),
              ],
            ),
          );
        });
  }
}
