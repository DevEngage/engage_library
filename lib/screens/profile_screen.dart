
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProfileScreen extends HookWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.withOpacity(0.5),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/imgs/green_background.jpg'))), // Image.asset('assets/imgs/background.png') ),
        child: ListView(children: <Widget>[

        ]));
  }

}