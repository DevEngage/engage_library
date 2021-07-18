import 'package:earn_it/models/goal_model.dart';
import 'package:earn_it/models/task_model.dart';
import 'package:earn_it/widgets/confirm_widget.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatefulWidget {
  final GoalModel goal;
  final TaskModel task;
  TaskItem({Key? key, required this.goal, required this.task})
      : super(key: key);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool checked = false;
  _TaskItemState();

  @override
  Widget build(BuildContext context) {
    // final checked = useState<bool>(false);

    return GestureDetector(
        onTap: () => _showOptions(context, widget.task, widget.goal),
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
                    borderRadius: new BorderRadius.all(
                      const Radius.circular(2.0),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Transform.scale(
                          scale: 1.3,
                          child: Theme(
                            data: ThemeData(
                                unselectedWidgetColor: Colors.deepPurple),
                            child: Checkbox(
                              value: widget.task.isDone,
                              tristate: false,
                              onChanged: (bool? newVal) async =>
                                  await widget.goal.toggleTask(widget.task),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(widget.task.name ?? ''),
                              Text(
                                'Due: ${widget.task.dueAt == null ? 'Never' : widget.task.dueAt}',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
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

  _showOptions(context, TaskModel task, GoalModel goal) {
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
                    await goal.toggleTask(task);
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
                      await goal.removeTask(task);
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
