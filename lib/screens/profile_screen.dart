import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProfileScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.deepPurple.withOpacity(0.5),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    'assets/imgs/green_background.jpg'))), // Image.asset('assets/imgs/background.png') ),
        child: ListView(children: <Widget>[
          numberRow(),
          numberRow(),
        ]));
  }

  numberRow() {
    return Row(children: <Widget>[
      Expanded(
          child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              // color: Colors.green,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.65),
                  borderRadius: BorderRadius.all(const Radius.circular(15.0))),
              child: Wrap(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.all(const Radius.circular(5.0))),
                    child: Text(
                      '10',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(4).copyWith(left: 20),
                      child: Text(
                        'Compeleted Goals',
                        style: TextStyle(fontSize: 22, color: Colors.black54),
                      ))
                ],
              )))
    ]);
  }
}
