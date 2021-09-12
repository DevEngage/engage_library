import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class EngageBaseScreen extends StatefulWidget {
  final Widget body;
  final bool searchBar;
  EngageBaseScreen({Key? key, required this.body, this.searchBar = false})
      : super(key: key);

  @override
  _EngageBaseScreenState createState() => _EngageBaseScreenState();
}

class _EngageBaseScreenState extends State<EngageBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        leading: GFIconButton(
          icon: Icon(
            Icons.message,
            color: Colors.white,
          ),
          onPressed: () {},
          type: GFButtonType.transparent,
        ),
        title: Text("GF Appbar"),
        searchBar: widget.searchBar,
        actions: <Widget>[
          GFIconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {},
            type: GFButtonType.transparent,
          ),
        ],
      ),
      body: Container(),
    );
  }
}
