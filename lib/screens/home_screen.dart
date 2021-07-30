import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earn_it/controllers/goal_controller.dart';
import 'package:earn_it/models/goal_model.dart';
import 'package:earn_it/widgets/goal_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final GoalController goalController = Get.put(GoalController());
  @override
  Widget build(BuildContext context) {
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
        child: GetBuilder<GoalController>(
          builder: (_) => ListView(
            children: <Widget>[
              // Container(
              //   color: Colors.black38,
              //   child: Padding(
              //     padding:
              //         const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              //     child: TextFormField(
              //       // initialValue: goalController.lastQuery,
              //       onChanged: (value) {
              //         goalController.search(value);
              //       },
              //       style: Theme.of(context)
              //           .textTheme
              //           .bodyText1!
              //           .copyWith(color: Colors.white, letterSpacing: 1.2),
              //       decoration: InputDecoration(
              //         border: InputBorder.none,
              //         hintText: "Search",
              //         focusColor: Colors.white,
              //         hintStyle: Theme.of(context)
              //             .textTheme
              //             .bodyText1!
              //             .copyWith(color: Colors.white54),
              //         icon: Icon(
              //           Icons.search,
              //           color: Colors.greenAccent,
              //         ),
              //         contentPadding: EdgeInsets.zero,
              //       ),
              //       keyboardType: TextInputType.text,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 50,
              // ),
              StreamBuilder<QuerySnapshot>(
                  stream: goalController.ref.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData)
                      return Row(children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(20),
                            // color: Colors.green,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.65),
                              borderRadius: BorderRadius.all(
                                const Radius.circular(15.0),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'You have no goals lined up. Add one!',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black54),
                              ),
                            ),
                          ),
                        ),
                      ]);
                    else
                      return Column(
                        children: [
                          for (var item in snapshot.data?.docs ?? [])
                            GoalItem(
                              goal: item.data() as GoalModel,
                            )
                        ],
                      );
                  }),
            ],
          ),
        ),
      ),
    ); // ListView.builder()
  }
}
