import 'package:EarnIt/models/goal.dart';
import 'package:EarnIt/models/task.dart';
import 'package:EarnIt/models/task_model.dart';
import 'package:EarnIt/providers/goal_provider.dart';
import 'package:EarnIt/widgets/confirm_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class TaskItem extends HookWidget {
  final Goal goal;
  final Task task;

  TaskItem({this.goal, this.task});

  @override
  Widget build(BuildContext context) {
    final checked = useState<bool>(false);

    return GestureDetector(
        onTap: () => _showOptions(context, task, goal),
        // onLongPress: () => _showOptions(context),
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 8)
                      .copyWith(bottom: 8),
                  padding: const EdgeInsets.all(10),
                  // color: Colors.green,
                  decoration: new BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(2.0))),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Transform.scale(
                            scale: 1.3,
                            child: Theme(
                                data: ThemeData(
                                    unselectedWidgetColor: Colors.deepPurple),
                                child: Checkbox(
                                    value: task.isDone,
                                    tristate: false,
                                    onChanged: (bool newVal) async =>
                                        await Provider.of<Goals>(context,
                                                listen: false)
                                            .toggleTask(goal, task)))),
                      ),
                      Expanded(
                          child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(task.name),
                              Text(
                                  'Due: ${task.dueAt == null ? 'Never' : task.dueAt}',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54)),
                            ],
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ]),

            // add subitems
          ],
        ));
    // ListView.builder()
  }

  _showOptions(context, task, goal) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Mark Done',
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: Icon(
                    Icons.check,
                    color: Colors.black,
                  ),
                  onTap: () async {
                    await Provider.of<Goals>(context, listen: false)
                        .toggleTask(goal, task);
                    Navigator.pop(context);
                  },
                ),
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
                    await Navigator.pushNamed(context, '/editTask',
                        arguments: <String, dynamic>{
                          'id': null,
                          'goal': goal,
                          'task': task
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
                        title: 'Delete Task',
                        message: 'Warning you are about to delete this task',
                        onAgreed: () async {
                      await Provider.of<Goals>(context, listen: false)
                          .removeTask(goal, task);
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
