
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GoalItem extends HookWidget {

  @override
  Widget build(BuildContext context) {


    return Column(children: <Widget>[
      Row(children: <Widget>[
        Expanded(child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        // color: Colors.green,
        decoration: new BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: new BorderRadius.all(
                        const Radius.circular(15.0))),
        child: Row(children: <Widget>[
          
          Transform.scale(
                scale: 1.5, child: 
                Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.deepPurple),
                  child: Checkbox(value: false, tristate: false, onChanged: (bool newVal) => true, ))),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            Text('Name'),
            Text('Reward')
          ],),
          Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            Transform.rotate(angle: -1.5, child: IconButton(icon: Icon(Icons.chevron_left), onPressed: () => true,),),

          ],)),
        ],),
        ),),]),

        // add subitems
      ],);
       // ListView.builder()
  }

}