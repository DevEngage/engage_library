import 'package:EarnIt/providers/goal_provider.dart';
import 'package:EarnIt/widgets/goal_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            child: Icon(Icons.add),
            onPressed: () async {
              await Navigator.pushNamed(context, '/editGoals',
                  arguments: <String, dynamic>{
                    'id': null
                  }); // _addEditGoal(context, currentDate, goalCategory),
              Provider.of<Goals>(context, listen: false).getList();
            }),
        body: Container(
            decoration: BoxDecoration(
                color: Colors.deepPurple.withOpacity(0.5),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'assets/imgs/background.png'))), // Image.asset('assets/imgs/background.png') ),
            child: Consumer<Goals>(
                builder: (context, model, _) => ListView(
                      children: <Widget>[
                        Container(
                            color: Colors.black38,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: TextFormField(
                                onChanged: (value) {
                                  Provider.of<Goals>(context, listen: false)
                                      .search(value);
                                },
                                style: Theme.of(context)
                                    .textTheme
                                    .title
                                    .copyWith(
                                        color: Colors.white,
                                        letterSpacing: 1.2),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search",
                                  focusColor: Colors.white,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .subhead
                                      .copyWith(color: Colors.white54),
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.greenAccent,
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            )),
                        if ((model.list.isNotEmpty))
                          ...(model.list ?? [])
                              .map((item) => GoalItem(
                                    goal: item,
                                  ))
                              .toList(),
                        if (model.list.isEmpty)
                          Row(children: <Widget>[
                            Expanded(
                                child: Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(20),
                                    // color: Colors.green,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.65),
                                        borderRadius: BorderRadius.all(
                                            const Radius.circular(15.0))),
                                    child: Center(
                                        child: Text(
                                      'You have no goals lined up. Add one!',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black54),
                                    ))))
                          ]),
                      ],
                    )))); // ListView.builder()
  }
}
