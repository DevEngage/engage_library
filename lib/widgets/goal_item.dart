import 'package:earn_it/models/goal_model.dart';
import 'package:flutter/material.dart';

class Entry {
  Entry(this.title, [this.children = const <Widget>[]]);
  final String title;
  final List<Widget> children;
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      backgroundColor: Colors.white,
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

class GoalsAccordian extends StatefulWidget {
  final List list;

  GoalsAccordian({Key? key, this.list = const []}) : super(key: key);

  @override
  _GoalsAccordianState createState() => _GoalsAccordianState();
}

class _GoalsAccordianState extends State<GoalsAccordian> {
  List<Entry> data = [];

  // data = list
  //     .map((item) => Entry('test', [
  //           Text('test')
  //           // TaskItem(),
  //           // TaskItem(),
  //           // TaskItem(),
  //         ]))
  //     .toList();
  _GoalsAccordianState();

  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? Text('Loading')
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                EntryItem(data[index]),
            itemCount: data.length,
          );
  }
}

class GoalItem extends StatefulWidget {
  final bool changePage;
  final GoalModel goal;
  GoalItem({Key? key, this.changePage = true, required this.goal})
      : super(key: key);

  @override
  _GoalItemState createState() => _GoalItemState();
}

class _GoalItemState extends State<GoalItem> {
  @override
  Widget build(BuildContext context) {
    // final expended = useState(false);

    if (widget.goal == null) return Text('');

    return GestureDetector(
        onTap: () async {
          // await widget.goal.getTask();
          if (widget.changePage)
            Navigator.pushNamed(context, '/viewGoal',
                arguments: <String, dynamic>{'id': null, 'goal': widget.goal});
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
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(15.0))),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Transform.scale(
                          scale: 1.3,
                          child: Theme(
                            data: ThemeData(
                                unselectedWidgetColor: Colors.deepPurple),
                            child: Radio<bool>(
                              value: widget.goal.isDone,
                              groupValue: true,
                              activeColor: Colors.deepPurple,
                              onChanged: (bool? newVal) => null,
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
                              Text('Goal: ${widget.goal.name}'),
                              Wrap(
                                children: <Widget>[
                                  Text('Reward: '),
                                  Text(
                                    widget.goal.reward,
                                    style:
                                        TextStyle(color: Colors.yellowAccent),
                                  )
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
                                            '${widget.goal.taskCount}',
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
                                  ))),
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
