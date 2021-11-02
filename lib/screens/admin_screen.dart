import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage_library/controllers/admin_controller.dart';
import 'package:engage_library/controllers/user_controller.dart';
import 'package:engage_library/screens/model_manage_screen.dart';
import 'package:engage_library/widgets/app_bar.dart';
import 'package:engage_library/widgets/menus/menu_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class EngageAdminScreen extends StatelessWidget {
  final List<Widget> _children = [
    // EngageHomeScreen(),
    EngageModelManageScreen(),
    EngageModelManageScreen(),
    EngageModelManageScreen(),
    EngageModelManageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final adminContonroller = Get.put(EngageAdminController());
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: Colors.deepPurple,
      //     child: Icon(Icons.add),
      //     onPressed: () async {
      //       await Navigator.pushNamed(
      //         context,
      //         '/editGoal',
      //         arguments: <String, dynamic>{'id': null},
      //       ); // _addEditGoal(context, currentDate, goalCategory),
      //       // Provider.of<Goals>(context, listen: false).getList();
      //     }),
      drawer: TaxbitMenuDrawer(),
      appBar: EngageAppBar(),
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
          child: _children[adminContonroller.currentIndex]),
      bottomNavigationBar: GetBuilder<EngageAdminController>(
        builder: (_) => BottomNavigationBar(
          onTap: adminContonroller.onTabTapped, // new
          currentIndex: adminContonroller.currentIndex, // new
          backgroundColor: Colors.black,
          fixedColor: Colors.black,
          unselectedItemColor: Colors.grey,
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
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Users')
          ],
        ),
      ),
    ); // ListView.builder()
  }
}
