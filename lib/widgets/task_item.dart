
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TaskItem extends HookWidget {

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
                      color: Colors.white.withOpacity(0.7),
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

  
  _showOptions(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
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
                    "Inbox",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.inbox,
                    color: Colors.white,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    "Starred",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.star_border,
                    color: Colors.white,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    "Sent",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    "Trash",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    "Spam",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.error,
                    color: Colors.white,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    "Drafts",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.mail_outline,
                    color: Colors.white,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          );
        });
  }

}