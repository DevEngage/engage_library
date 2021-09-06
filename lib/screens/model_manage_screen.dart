import 'package:flutter/material.dart';

class EngageModelManageScreen extends StatelessWidget {
  const EngageModelManageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final models =
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.add),
          onPressed: () async {
            await Navigator.pushNamed(
              context,
              '/editGoal',
              arguments: <String, dynamic>{'id': null},
            ); // _addEditGoal(context, currentDate, goalCategory),
            // Provider.of<Goals>(context, listen: false).getList();
          }),
      body: ListView(
        children: [],
      ),
    );
  }
}
