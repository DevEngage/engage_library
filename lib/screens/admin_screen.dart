import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage_library/controllers/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class EngageAdminScreen extends StatelessWidget {
  int _currentIndex = 0;
  final List<Widget> _children = [
    // EngageHomeScreen(),
  ];

  void onTabTapped(int index) {
    _currentIndex = index;
  }

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
            children: <Widget>[],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Collections',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.content_copy),
            label: 'Models',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Screens'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Users')
        ],
      ),
    ); // ListView.builder()
  }
}
