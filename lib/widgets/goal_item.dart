
import 'package:EarnIt/widgets/task_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GoalItem extends HookWidget {

  @override
  Widget build(BuildContext context) {
    final expended = useState(false);


    return GestureDetector(onTap: () => _askedToLead(context), child: Column(children: <Widget>[
      Row(children: <Widget>[
        Expanded(child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        // color: Colors.green,
        decoration: new BoxDecoration(
                    color: Colors.white.withOpacity(0.65),
                    borderRadius: new BorderRadius.all(
                        const Radius.circular(15.0))),
        child: Row(children: <Widget>[
          
          Container(child: 
            Transform.scale(
                scale: 1.3, child: 
                Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.deepPurple),
                  child: Radio<bool>(value: true, groupValue: true, activeColor: Colors.deepPurple, onChanged: (bool newVal) => true, ))),
          ),
              
          Expanded( child: 
            Row(children: <Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                Text('Goal: workout'),
                Wrap(children: <Widget>[ Text('Reward: '), Text('Pizza', style: TextStyle(color: Colors.yellowAccent),)],),
              ],),
              // Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              //   Transform.rotate(angle: expended.value ? -1.6 : 0, child: IconButton(icon: Icon(Icons.chevron_left), onPressed: () => true,),),
              // ],)),
              

              Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                Column(children: <Widget>[
                  Text('10', style: TextStyle(color: Colors.teal, fontSize: 16)),
                  // Text('tasks', style: TextStyle(color: Colors.black87, fontSize: 10)),
                ],),
                // IconButton(icon: Icon(Icons.calendar_today), onPressed: () => true,),
                IconButton(icon: Icon(Icons.notifications_none), color: Colors.teal, onPressed: () => true,),
                // IconButton(icon: Icon(Icons.check_box_outline_blank), onPressed: () => true,),
              ],)),

            ],
          ) ),


        ],),
        ),),]),
        
        
        // add subitems
      ],));
       // ListView.builder()
  }


  Future<void> _askedToLead(context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.white.withOpacity(0.8),
          title: Row(children: <Widget>[
            Row(children: <Widget>[ 
              Text('Tasks'), 
              IconButton(icon: Icon(Icons.add_circle_outline), color: Colors.deepPurpleAccent, onPressed: () => _addEditTask(context),),
            ],),
            Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                // Column(children: <Widget>[
                //   Text('10', style: TextStyle(color: Colors.black87, fontSize: 16)),
                //   Text('tasks', style: TextStyle(color: Colors.black87, fontSize: 10)),
                // ],),
                // IconButton(icon: Icon(Icons.notifications_none), color: Colors.teal, onPressed: () => true,),
                // IconButton(icon: Icon(Icons.check_box_outline_blank), onPressed: () => true,),
              ],)),
          ]),
          children: <Widget>[
            TaskItem(),
            TaskItem(),
            // SimpleDialogOption(
            //   onPressed: () { Navigator.pop(context, Department.treasury); },
            //   child: const Text('Treasury department'),
            // ),
            // SimpleDialogOption(
            //   onPressed: () { Navigator.pop(context, Department.state); },
            //   child: const Text('State department'),
            // ),
          ],
        );
      }
    );
  }

  Future<void> _addEditGoal(context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.white.withOpacity(0.8),
          title: Row(children: <Widget>[
            Row(children: <Widget>[ 
              Text('Tasks'), 
              IconButton(icon: Icon(Icons.add_circle_outline), color: Colors.deepPurpleAccent, onPressed: () => _addEditTask(context),),
            ],),
            Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                // Column(children: <Widget>[
                //   Text('10', style: TextStyle(color: Colors.black87, fontSize: 16)),
                //   Text('tasks', style: TextStyle(color: Colors.black87, fontSize: 10)),
                // ],),
                // IconButton(icon: Icon(Icons.notifications_none), color: Colors.teal, onPressed: () => true,),
                // IconButton(icon: Icon(Icons.check_box_outline_blank), onPressed: () => true,),
              ],)),
          ]),
          children: <Widget>[
            TaskItem(),
            TaskItem(),
            // SimpleDialogOption(
            //   onPressed: () { Navigator.pop(context, Department.treasury); },
            //   child: const Text('Treasury department'),
            // ),
            // SimpleDialogOption(
            //   onPressed: () { Navigator.pop(context, Department.state); },
            //   child: const Text('State department'),
            // ),
          ],
        );
      }
    );
  }


  Future<void> _addEditTask(context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.white.withOpacity(0.8),
          title: Row(children: <Widget>[
            Row(children: <Widget>[ 
              Text('Edit Task'), 
              IconButton(icon: Icon(Icons.add_circle_outline), color: Colors.deepPurpleAccent, onPressed: () => true,),
            ],),
            Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                // Column(children: <Widget>[
                //   Text('10', style: TextStyle(color: Colors.black87, fontSize: 16)),
                //   Text('tasks', style: TextStyle(color: Colors.black87, fontSize: 10)),
                // ],),
                // IconButton(icon: Icon(Icons.notifications_none), color: Colors.teal, onPressed: () => true,),
                // IconButton(icon: Icon(Icons.check_box_outline_blank), onPressed: () => true,),
              ],)),
          ]),
          children: <Widget>[
            TaskItem(),
            TaskItem(),
            // SimpleDialogOption(
            //   onPressed: () { Navigator.pop(context, Department.treasury); },
            //   child: const Text('Treasury department'),
            // ),
            // SimpleDialogOption(
            //   onPressed: () { Navigator.pop(context, Department.state); },
            //   child: const Text('State department'),
            // ),
          ],
        );
      }
    );
  }


}