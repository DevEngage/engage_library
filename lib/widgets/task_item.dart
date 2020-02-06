
import 'package:EarnIt/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TaskItem extends HookWidget {
  final TaskModel task;

  TaskItem({this.task});

  @override
  Widget build(BuildContext context) {
    final expended = useState(false);
    final checked = useState<bool>(false);

    return GestureDetector(
      onTap: () => checked.value = !checked.value, 
      onLongPress: () => _showOptions(context),
      child: Column(children: <Widget>[
        Row(children: <Widget>[
          Expanded(child: Container(
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          padding: const EdgeInsets.all(10),
          // color: Colors.green,
          decoration: new BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: new BorderRadius.all(
                          const Radius.circular(2.0))),
          child: Row(children: <Widget>[
            
            Container(child: 
              Transform.scale(
                  scale: 1.3, child: 
                  Theme(
                    data: ThemeData(unselectedWidgetColor: Colors.deepPurple),
                    child: Checkbox(value: checked.value, tristate: false, onChanged: (bool newVal) => checked.value = !checked.value, ))),
            ),
                
            Expanded( child: Row(children: <Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                Text(task.name),
                Text('Due: ${task.dueAt}', style: TextStyle(fontSize: 12, color: Colors.black54)),
              ],),
            ],) ),


          ],),
          ),),]),
          
          
          // add subitems
        ],));
       // ListView.builder()
  }

  
  _showOptions(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 120,
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
                    'Edit',
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  onTap: () {},
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
                  onTap: () {},
                ),
              ],
            ),
          );
        });
  }

}