import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class EngagedHomeScreen extends StatelessWidget {
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
              Container(
                padding: const EdgeInsets.all(4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(right: 6),
                      child: Text(
                        'Filter',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<dynamic>(
                        hint: Text(
                          ' ',
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                        // underline: Container(
                        //   height: 2,
                        //   color: Colors.deepPurpleAccent,
                        // ),
                        value: goalController.selectedFilter,
                        onChanged: (dynamic newValue) {
                          goalController.selectedFilter = newValue;
                          goalController.update();
                        },
                        items: goalController.filterList.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: goalController.ownerRef.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    print(snapshot);
                    if (!snapshot.hasData ||
                        snapshot.data?.docs == null ||
                        snapshot.data!.docs.length < 1)
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
