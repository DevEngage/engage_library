import 'package:earn_it/controllers/goal_controller.dart';
import 'package:earn_it/models/goal_model.dart';
import 'package:earn_it/models/template_model.dart';
import 'package:flutter/material.dart';

class TemplateItem extends StatefulWidget {
  final bool changePage;
  final TemplateModel template;
  TemplateItem({Key? key, this.changePage = true, required this.template})
      : super(key: key);

  @override
  _TemplateItemState createState() => _TemplateItemState();
}

class _TemplateItemState extends State<TemplateItem> {
  @override
  Widget build(BuildContext context) {
    // final expended = useState(false);
    if (widget.template == null) return Text('');

    return GestureDetector(
        onTap: () async {
          // await widget.template.getTasks();
          if (widget.changePage) {
            // Navigator.pushNamed(context, '/viewGoal',
            //     arguments: <String, dynamic>{'id': null, 'goal': widget.goal});
          }
        },
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 5),
                  padding: const EdgeInsets.all(10),
                  // color: Colors.green,
                  decoration: new BoxDecoration(
                    color: Colors.white.withOpacity(0.65),
                    borderRadius: new BorderRadius.all(
                      const Radius.circular(15.0),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      // Container(
                      //   child: Transform.scale(
                      //     scale: 1.3,
                      //     child: Theme(
                      //       data: ThemeData(
                      //           unselectedWidgetColor: Colors.deepPurple),
                      //       child: Radio<bool>(
                      //         value: widget.template.isDone,
                      //         groupValue: true,
                      //         activeColor: Colors.deepPurple,
                      //         onChanged: (bool? newVal) => null,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                          child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${widget.template.name}', //Goal:
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Wrap(
                                children: <Widget>[
                                  // Text(
                                  //   'Reward: ',
                                  //   style: TextStyle(
                                  //     color: Colors.black,
                                  //   ),
                                  // ),
                                  // Text(
                                  //   widget.template.reward.isNotEmpty
                                  //       ? widget.goal.reward
                                  //       : 'No Reward Set',
                                  //   style: TextStyle(
                                  //       color: widget.goal.reward.isNotEmpty
                                  //           ? Colors.yellowAccent
                                  //           : Colors.red),
                                  // )
                                ],
                              ),
                            ],
                          ),
                          // Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                          //   Transform.rotate(angle: expended.value ? -1.6 : 0, child: IconButton(icon: Icon(Icons.chevron_left), onPressed: () => true,),),
                          // ],)),

                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                right: 15,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        '${widget.template.goalCount}',
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        'tasks',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // IconButton(icon: Icon(Icons.calendar_today), onPressed: () => true,),

                                  // IconButton(icon: Icon(Icons.notifications_none), color: Colors.black45, onPressed: () => true,),

                                  // IconButton(icon: Icon(Icons.check_box_outline_blank), onPressed: () => true,),
                                ],
                              ),
                            ),
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
}
