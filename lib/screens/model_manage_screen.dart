import 'package:engage_library/models/test_model.dart';
import 'package:engage_library/utils/engagefire_collection.dart';
import 'package:engage_library/utils/engagefire_doc.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class EngageModelManageScreen extends StatelessWidget {
  const EngageModelManageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final models = EngagefireCollection.to('engageModel');
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.add),
          onPressed: () async {
            print('test');
            // var test = EngagefireDoc(path: 'test');
            var test = new TestModel();
            test.id = 'test';
            test.name = 'test';
            test.test = 'test';
            test.$toJson();
            // await Navigator.pushNamed(
            //   context,
            //   '/admin-add-models',
            //   arguments: <String, dynamic>{'id': null},
            // ); // _addEditGoal(context, currentDate, goalCategory),
            // Provider.of<Goals>(context, listen: false).getList();
          }),
      body: ListView(
        children: [
          models.stream(child: () => Text('test')),
        ],
      ),
    );
  }
}
