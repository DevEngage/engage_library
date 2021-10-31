// import 'package:consumer_mobile/auth0/auth_service.dart';
// import 'package:consumer_mobile/controllers/users_controller.dart';
// import 'package:consumer_mobile/utils/app_themes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// import 'package:get/get.dart';

// class TaxbitMenuDrawer extends StatefulWidget {
//   TaxbitMenuDrawer({
//     Key? key,
//   });

//   @override
//   _TaxbitMenuDrawerState createState() => _TaxbitMenuDrawerState();
// }

// class _TaxbitMenuDrawerState extends State<TaxbitMenuDrawer> {
//   buildMenuItem(title, icon, route) {
//     return ListTile(
//       // minVerticalPadding: 10,
//       title: Wrap(
//         children: [
//           Icon(
//             icon,
//             size: 16,
//             color: Theme.of(context).iconTheme.color,
//           ),
//           SizedBox(
//             width: 6,
//           ),
//           Text(
//             title,
//             style: Theme.of(context).textTheme.bodyText1,
//           ),
//         ],
//       ),
//       onTap: () {
//         Get.toNamed(route);
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final UsersController usersController = Get.put(UsersController());
//     return ClipRRect(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(26.0)),
//       child: Drawer(
//         child: ListView(
//           padding: EdgeInsets.only(left: 22, top: 52),
//           children: [
//             Container(
//               padding: EdgeInsets.only(left: 16, top: 20),
//               child:
//                   Row(children: [Image.asset('assets/images/full-logo.png')]),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             buildMenuItem('Settings', FeatherIcons.settings, 'settings'),
//             buildMenuItem(
//                 'Help Center', FeatherIcons.helpCircle, 'help-center'),
//             buildMenuItem(
//                 'App Feedback', FeatherIcons.messageSquare, 'help-center'),
//             Container(
//               padding: EdgeInsets.only(left: 0, top: 50),
//               child: Row(children: [
//                 SizedBox(
//                   width: 160,
//                   child: TextButton(
//                     style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.resolveWith<Color?>(
//                               (Set<MaterialState> states) =>
//                                   AppThemes.primaryColor),
//                     ),
//                     child:
//                         Text('Sign Out', style: TextStyle(color: Colors.white)),
//                     onPressed: () async {
//                       Get.back();
//                       await AuthService.instance.logout();
//                       await Get.toNamed('/login');
//                     },
//                   ),
//                 ),
//               ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
