import 'package:earn_it/controllers/goal_controller.dart';
import 'package:earn_it/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GoalController goalController = GoalController.to;
    return Container(
      decoration: BoxDecoration(
          color: Colors.deepPurple.withOpacity(0.5),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  'assets/imgs/green_background.jpg'))), // Image.asset('assets/imgs/background.png') ),
      child: GetBuilder<GoalController>(
        builder: (_) => ListView(
          children: <Widget>[
            numberRow('Goal', goalController.goalsCompleted),
            numberRow('Task', goalController.tasksCompleted),
            // Consumer<User>(
            //     builder: (context, model, _) =>
            FlatButton(
                padding: const EdgeInsets.only(top: 25, bottom: 25),
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () async {
                  UserController.to.logout();
                  await Navigator.pushNamed(context, '/login');
                }),
          ],
        ),
      ),
    );
  }

  numberRow(title, count) {
    return Row(
      children: <Widget>[
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
                    '$count',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4).copyWith(left: 20),
                  child: Text(
                    '$title${count != 1 ? "s" : ""} compeleted',
                    style: TextStyle(fontSize: 22, color: Colors.black54),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
