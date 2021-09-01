// import 'package:engage_library/utils/engagefire_collection.dart';
// import 'package:engage_library/widgets/quick_list.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class EngagefireList extends StatefulWidget {
//   final String path;
//   EngagefireList({
//     Key? key,
//     required this.path,
//   }) : super(key: key);

//   @override
//   _EngagefireListState createState() => _EngagefireListState();
// }

// class _EngagefireListState extends State<EngagefireList> {
//   final EngagefireCollection collection;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: <Widget>[
//           for (var collection in (widget.collections ?? []))
//             ListTile(
//               title: Text(
//                 collection.tableName,
//                 style: TextStyle(color: Colors.white),
//               ),
//               onTap: () => Get.to(
//                 QuickList(
//                   collection: collection,
//                   addRoute: '/QuickAdd',
//                   appBar: AppBar(
//                     title: Text(collection.tableName),
//                   ),
//                   onTap: (item) => Get.toNamed(
//                     '/QuickAdd',
//                     arguments: {'collection': item},
//                   ),
//                 ),
//               ),
//             )
//         ],
//       ),
//     );
//   }
// }
