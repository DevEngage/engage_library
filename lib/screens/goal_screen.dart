import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earn_it/constants/constants.dart';
import 'package:earn_it/controllers/goal_controller.dart';
import 'package:earn_it/models/goal_model.dart';
import 'package:earn_it/models/task_model.dart';
import 'package:earn_it/widgets/confirm_widget.dart';
import 'package:earn_it/widgets/task_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

class GoalScreen extends StatelessWidget {
  final id;
  final GoalController goalController = Get.put(GoalController());
  // final GoalModel goal;

  GoalScreen({
    this.id,
    // this.goal,
  });

  @override
  Widget build(BuildContext context) {
    final dynamic args = Get.arguments;
    GoalModel goal = args['goal'] ?? GoalModel();

    if (goal == null) return Text('Loading...');
    return StreamBuilder<DocumentSnapshot<GoalModel>>(
      stream: goalController.ref.doc(goal.id).snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot<GoalModel>> snapshot) {
        if (snapshot.hasData) {
          goal = snapshot.data!.data()!;
        }
        return Scaffold(
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.add),
              onPressed: () async {
                goalController.goalEdit = goal;
                goalController.taskEdit = null;
                await Navigator.pushNamed(context, '/editTask',
                    arguments: <String, dynamic>{'id': null, 'goal': goal});
                await goal.getTasks();
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
            // title: Text('GoalModel Name'),
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
                  BlendMode.srcOver,
                ),
              ),
            ), // Image.asset('assets/imgs/background.png') ),
            child: StreamBuilder<QuerySnapshot>(
              stream: goal.taskRef?.snapshots(),
              builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) =>
                  ListView(
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
                            direction: Axis.vertical,
                            children: <Widget>[
                              Text('Reward: ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              Text(
                                goal.reward,
                                style: TextStyle(
                                    color: Colors.yellowAccent, fontSize: 20),
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
                                'Due on ${DateFormat('MMMM d, yyyy').format(goal.dueAtDate!)}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppThemes.colorBlackOpacity8,
                                ),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Text('Reward: ${goal.reward}'),
                                Text(
                                  '${goal.details}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppThemes.colorBlackOpacity8,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  Container(child: Text('')),
                  // ...goal.tasks.map((task) => TaskItem(task: task, goal: goal)),
                  StreamBuilder<QuerySnapshot>(
                      stream: goal.taskRef?.snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData ||
                            snapshot.data?.docs == null ||
                            snapshot.data!.docs.length < 1)
                          return Row(children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(20),
                                // color: Colors.green,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.65),
                                  borderRadius: BorderRadius.all(
                                    const Radius.circular(15.0),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'You have no Tasks lined up. Add one!',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black54),
                                  ),
                                ),
                              ),
                            ),
                          ]);
                        else
                          return Column(
                            children: [
                              for (var item in snapshot.data?.docs ?? [])
                                TaskItem(
                                    task: item.data() as TaskModel, goal: goal)
                            ],
                          );
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _showOptions(context, GoalModel goal) {
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
                    goalController.goalEdit = goal;
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
                        title: 'Delete GoalModel',
                        message: 'Warning you are about to delete this goal',
                        onAgreed: () async {
                      await goal.remove();
                      Get.back();
                      Get.back();
                    });
                  },
                ),
              ],
            ),
          );
        });
  }
}
