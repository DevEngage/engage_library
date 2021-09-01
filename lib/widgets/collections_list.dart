// import 'package:engage_library/widgets/quick_list.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CollectionsList extends StatefulWidget {
//   final List collections;
//   CollectionsList({
//     Key key,
//     this.collections,
//   }) : super(key: key);

//   @override
//   _CollectionsListState createState() => _CollectionsListState();
// }

// class _CollectionsListState extends State<CollectionsList> {
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