import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WorldScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final results = useState<List>([]);
    final currentDate = useState<DateTime>();
    final goalCategory = useState<String>();

    return Container(
        decoration: BoxDecoration(
            color: Colors.deepPurple.withOpacity(0.5),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/imgs/space_world_medium.jpg'),
                colorFilter: ColorFilter.mode(
                    Colors.black45,
                    BlendMode
                        .srcOver))), // Image.asset('assets/imgs/background.png') ),
        child: ListView(children: <Widget>[
          Row(children: <Widget>[
            Expanded(
                child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
                    // color: Colors.green,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.65),
                        borderRadius:
                            BorderRadius.all(const Radius.circular(15.0))),
                    child: Center(
                        child: Text(
                      'Templates Coming Soon!',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ))))
          ]),
          // GoalItem(),
        ]));
  }
}
