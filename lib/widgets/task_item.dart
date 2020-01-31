
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TaskItem extends HookWidget {

  @override
  Widget build(BuildContext context) {
    final expended = useState(false);


    return GestureDetector(onTap: () => true, child: Column(children: <Widget>[
      Row(children: <Widget>[
        Expanded(child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        padding: const EdgeInsets.all(10),
        // color: Colors.green,
        decoration: new BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: new BorderRadius.all(
                        const Radius.circular(2.0))),
        child: Row(children: <Widget>[
          
          Container(child: 
            Transform.scale(
                scale: 1.3, child: 
                Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.deepPurple),
                  child: Checkbox(value: false, tristate: false, onChanged: (bool newVal) => true, ))),
          ),
              
          Expanded( child: Row(children: <Widget>[
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              Text('Run for 30 mins'),
              Text('Due: Tuesday', style: TextStyle(fontSize: 12, color: Colors.black54)),
            ],),
          ],) ),


        ],),
        ),),]),
        
        
        // add subitems
      ],));
       // ListView.builder()
  }

}