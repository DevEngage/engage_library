import 'package:engage_library/controllers/user_controller.dart';
import 'package:engage_library/utils/engage_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EngageMenuDrawer extends StatefulWidget {
  final Widget? title;
  final List<EngageItem> menuItems;
  EngageMenuDrawer({Key? key, this.title, this.menuItems = const []});

  @override
  _EngageMenuDrawerState createState() => _EngageMenuDrawerState();
}

class _EngageMenuDrawerState extends State<EngageMenuDrawer> {
  buildMenuItem(title, icon, route) {
    return ListTile(
      // minVerticalPadding: 10,
      title: Wrap(
        children: [
          Icon(
            icon,
            size: 16,
            color: Theme.of(context).iconTheme.color,
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
      onTap: () {
        Get.toNamed(route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final EngageUserController usersController =
        Get.put(EngageUserController());
    return ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(26.0)),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.only(left: 22, top: 52),
          children: [
            if (widget.title != null)
              Container(
                padding: EdgeInsets.only(left: 16, top: 20),
                child: SizedBox(
                  width: 100,
                  child: Image.asset('assets/imgs/green_background.jpg',
                      width: 100),
                ),
              ),
            SizedBox(
              height: 20,
            ),
            for (EngageItem item in widget.menuItems)
              buildMenuItem(item.name, item.icon, item.routePath),
            // buildMenuItem('Help Center', Icons.help_center, 'help-center'f
            Container(
              padding: EdgeInsets.only(left: 0, top: 50),
              child: Row(children: [
                SizedBox(
                  width: 160,
                  child: TextButton(
                    // style: ButtonStyle(
                    //   backgroundColor:
                    //       MaterialStateProperty.resolveWith<Color?>(
                    //           (Set<MaterialState> states) =>
                    //               AppThemes.primaryColor),
                    // ),
                    child:
                        Text('Sign Out', style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      Get.back();
                      await usersController.logout();
                      await Get.toNamed('/login');
                    },
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
