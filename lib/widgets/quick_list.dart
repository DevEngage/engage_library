// import 'package:engage_library/classes/engage_parse_object.dart';
// import 'package:engage_library/classes/project.dart';
// import 'package:engage_library/screens/quick_add_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:engage_library/widgets/input.dart';
// import 'package:get/get.dart';
// import 'package:loading_overlay/loading_overlay.dart';
// import 'package:parse_server_sdk/parse_server_sdk.dart';

// class QuickList extends StatefulWidget {
//   final List<EngageParseObject> list;
//   final EngageParseObject collection;
//   final EngageParseObject parent;
//   final Function onTap;
//   final onLongPress;
//   final addRoute;
//   final appBar;
//   final EngageProject project;
//   QuickList({
//     Key key,
//     this.list = const [],
//     this.onTap,
//     this.onLongPress,
//     this.collection,
//     this.parent,
//     this.addRoute = '/quickAdd',
//     this.appBar,
//     this.project,
//   }) : super(key: key);

//   @override
//   _QuickListState createState() => _QuickListState();
// }

// class _QuickListState extends State<QuickList> {
//   List<EngageParseObject> quickList = [];
//   bool isLoading = false;
//   String searchTerm = '';
//   EngageProject project;
//   @override
//   void initState() {
//     super.initState();
//     if (widget.collection != null) {
//       getList();
//     } else {
//       quickList = widget.list;
//     }
//     project = widget.project ?? EngageProject();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   getList() async {
//     setState(() {
//       isLoading = true;
//     });
//     try {
//       QueryBuilder query = QueryBuilder(widget.collection);
//       if (widget.parent != null) {
//         query.whereEqualTo(
//             (widget.parent.tableName.toLowerCase() ?? ''), widget.parent);
//       }
//       ParseResponse response = await query.query();
//       setState(() {
//         if (response.success) {
//           quickList = List<EngageParseObject>.from(response.results ?? []);
//         } else {
//           quickList = [];
//         }
//         isLoading = false;
//       });
//     } catch (error) {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   add() async {
//     await Get.to(
//       QuickAddScreen(
//         collection: widget.collection is ParseObject
//             ? widget.collection.clone(null)
//             : widget.collection,
//         parent: widget.parent,
//         // arrayToSave: value.name.toLowerCase(),
//         addRoute: widget.addRoute,
//         project: project,
//       ),
//     );
//     // await Get.toNamed(widget.addRoute,
//     //     arguments: {'collection': widget.collection, 'parent': widget.parent});
//     await getList();
//   }

//   select(item) async {
//     if (widget.onTap != null) {
//       await widget.onTap(item);
//       await getList();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: widget.appBar,
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () => add(),
//       ),
//       body: LoadingOverlay(
//         isLoading: isLoading,
//         child: Container(
//           child: ListView(
//             children: <Widget>[
//               Container(
//                   padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
//                   child: EngageInput(
//                     isDarkBackground: true,
//                     labelText: 'Search',
//                     onChanged: (value) => setState(
//                         () => searchTerm = (value ?? '').toLowerCase()),
//                   )),
//               for (EngageParseObject item in (quickList ?? [])
//                   .where((element) =>
//                       (element.name ?? '').toLowerCase().contains(searchTerm))
//                   .toList())
//                 Column(children: <Widget>[
//                   ListTile(
//                     leading: item.image != null
//                         ? Image.network(item.image.url)
//                         : null,
//                     onTap: () => select(item),
//                     onLongPress: widget.onLongPress,
//                     title: Text(item.name,
//                         style: project != null && project.darkMode == true
//                             ? TextStyle(color: project.white)
//                             : null),
//                   ),
//                   Divider(height: 1, color: Colors.grey, thickness: 1)
//                 ])
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }