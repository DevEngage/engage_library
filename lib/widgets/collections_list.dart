import 'package:engage_library/utils/engagefire_collection.dart';
import 'package:engage_library/widgets/quick_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EngagefireList extends StatefulWidget {
  final String path;
  EngagefireList({
    Key? key,
    required this.path,
  }) : super(key: key);

  @override
  _EngagefireListState createState() => _EngagefireListState();
}

class _EngagefireListState extends State<EngagefireList> {
  late EngagefireCollection collection;

  @override
  void initState() {
    super.initState();
    collection = EngagefireCollection(path: widget.path);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          for (var collection in collection.list)
            ListTile(
              title: Text(
                collection.tableName,
                style: TextStyle(color: Colors.white),
              ),
              onTap: null,
            )
        ],
      ),
    );
  }
}
