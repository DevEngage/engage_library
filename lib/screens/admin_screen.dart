import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage_library/controllers/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class EngageAdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userContonroller = Get.put(EngageUserController());
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
      body: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.withOpacity(0.5),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/imgs/background.png',
            ),
          ),
        ), // Image.asset('assets/imgs/background.png') ),
        child: GetBuilder<EngageUserController>(
          builder: (_) => ListView(
            children: <Widget>[
              // StreamBuilder<QuerySnapshot>(
              //     stream: userContonroller.snapshots(),
              //     builder: (BuildContext context,
              //         AsyncSnapshot<QuerySnapshot> snapshot) {
              //       print(snapshot);
              //       if (!snapshot.hasData ||
              //           snapshot.data?.docs == null ||
              //           snapshot.data!.docs.length < 1)
              //         return Row(children: <Widget>[
              //           Expanded(
              //             child: Container(
              //               margin: const EdgeInsets.all(10),
              //               padding: const EdgeInsets.all(20),
              //               // color: Colors.green,
              //               decoration: BoxDecoration(
              //                 color: Colors.white.withOpacity(0.65),
              //                 borderRadius: BorderRadius.all(
              //                   const Radius.circular(15.0),
              //                 ),
              //               ),
              //               child: Center(
              //                 child: Text(
              //                   'You have no goals lined up. Add one!',
              //                   style: TextStyle(
              //                       fontSize: 18, color: Colors.black54),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ]);
              //       else
              //         return Column(
              //           children: [
              //             for (var item in snapshot.data?.docs ?? [])
              //               GoalItem(
              //                 goal: item.data() as GoalModel,
              //               )
              //           ],
              //         );
              //     }),
            ],
          ),
        ),
      ),
    ); // ListView.builder()
  }
}
