// // import 'package:engage_library/classes/engage_parse_object.dart';
// // import 'package:engage_library/classes/project.dart';
// // import 'package:engage_library/classes/quick_add.dart';
// // import 'package:engage_library/classes/quick_add_segment.dart';
// // import 'package:engage_library/classes/quick_add_tab.dart';
// import 'package:engage_library/utils/engagefire_collection.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // import 'package:engage_library/admin_theme.dart';
// import 'package:engage_library/widgets/confirm_widget.dart';
// import 'package:engage_library/widgets/input.dart';
// import 'package:engage_library/widgets/quick_list.dart';
// import 'package:get/get.dart';
// // import 'package:loading_overlay/loading_overlay.dart';
// // import 'package:parse_server_sdk/parse_server_sdk.dart';

// class QuickAddScreen extends StatefulWidget {
//   final EngagefireCollection collection;
//   final bool showAppBar;
//   final String addRoute;
//   // final EngageProject project;
//   final dynamic model;
//   // final EngageParseObject parent;
//   final String arrayToSave;

//   QuickAddScreen({
//     Key? key,
//     required this.collection,
//     this.showAppBar = true,
//     this.addRoute = '/quickAdd',
//     // this.project,
//     this.model,
//     // this.parent,
//     this.arrayToSave,
//   }) : super(key: key);

//   @override
//   _QuickAddScreenState createState() => _QuickAddScreenState();
// }

// class _QuickAddScreenState extends State<QuickAddScreen> {
//   late EngagefireCollection collection;
//   // EngageParseObject parent;
//   // late String arrayToSave;
//   dynamic model;
//   bool showAppBar;
//   String addRoute;
//   int currentSegment = 0;
//   EngageProject project;
//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     collection = widget.collection;
//     showAppBar = widget.showAppBar;
//     addRoute = widget.addRoute;
//     // project = widget.project ?? EngageProject();
//     model = widget.model;
//     // parent = widget.parent;
//     // arrayToSave = widget.arrayToSave;
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   Map<int, Widget> buildSegments(List<QuickAddSegment> segments) {
//     Map<int, Widget> children = <int, Widget>{
//       0: Text('Details'),
//     };
//     for (var i = 0; i < segments.length; i++) {
//       children[i + 1] = Text(segments[i].name);
//     }
//     return children;
//   }

//   setLoading([state = false]) {
//     setState(() {
//       isLoading = state;
//     });
//   }

//   addSegItem(value) {
//     return Get.to(
//       QuickAddScreen(
//         model: value.collection is ParseObject
//             ? value.collection.clone(null)
//             : value.collection,
//         parent: value.parent,
//         arrayToSave: value.name.toLowerCase(),
//         addRoute: addRoute,
//         project: project,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final dynamic args = ModalRoute.of(context).settings.arguments;
//     if (args != null && args['collection'] != null)
//       collection = args['collection'];
//     if (args != null && args['parent'] != null) parent = args['parent'];
//     if (args != null && args['arrayToSave'] != null)
//       arrayToSave = args['arrayToSave'];
//     if (args != null && args['model'] != null) model = args['model'];
//     if (args != null && args['project'] != null) project = widget.project;
//     if (args != null && args['addRoute'] != null) addRoute = args['addRoute'];
//     if (collection != null && collection.getTabForm().isNotEmpty) {
//       return buildTabPage(context, collection);
//     } else if (collection != null && collection.getSegmentForm().isNotEmpty) {
//       return buildSegPage(context, collection);
//     } else {
//       return buildSinglePage(context, collection, true, arrayToSave, model);
//     }
//   }

//   buildSinglePage(
//     context, [
//     EngageParseObject collection,
//     showAppBarInternal = true,
//     arrayToSave,
//     model,
//   ]) {
//     if (parent != null &&
//         parent.objectId != null &&
//         collection != null &&
//         arrayToSave == null) {
//       collection.set((parent.tableName ?? '').toLowerCase(), parent,
//           forceUpdate: true);
//     }
//     return Scaffold(
//       appBar: showAppBar && showAppBarInternal
//           ? AppBar(
//               title: Text((collection != null && collection.objectId != null
//                       ? 'Edit '
//                       : 'Create ') +
//                   (arrayToSave != null ? arrayToSave : collection.tableName)),
//             )
//           : null,
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(left: 30),
//             child: FloatingActionButton(
//               heroTag: 'buildSinglePageDelete',
//               child: Icon(Icons.delete),
//               backgroundColor: Colors.red,
//               onPressed: () async {
//                 confirmWidget(context,
//                     confirmText: 'Delete!',
//                     title: 'Warning!',
//                     message: 'You are about to delete this item',
//                     warning: true, onAgreed: () async {
//                   setLoading(true);
//                   if (arrayToSave != null) {
//                     await parent.removeFromArray(arrayToSave, model);
//                   } else {
//                     await collection.delete();
//                   }
//                   setLoading(false);
//                   Navigator.pop(context);
//                 });
//               },
//             ),
//           ),
//           FloatingActionButton(
//             heroTag: 'buildSinglePage',
//             child: Icon(Icons.save),
//             onPressed: () async {
//               setLoading(true);
//               if (arrayToSave != null) {
//                 await parent.saveToArray(arrayToSave, model);
//               } else {
//                 await collection.save();
//               }
//               setLoading(false);
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//       body: LoadingOverlay(
//         isLoading: isLoading,
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: ListView(children: <Widget>[
//                 Container(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(children: <Widget>[
//                       // Object's Parent Field
//                       if (parent != null && arrayToSave == null)
//                         buildInput(
//                           QuickAdd(
//                             labelText: parent.tableName + ' (parent)',
//                             type: 'smartsingle',
//                             collection: parent,
//                             initialValue: parent.objectId,
//                             readOnly: true,
//                           ),
//                         ),
//                       if (parent != null && arrayToSave == null)
//                         Column(
//                           children: <Widget>[
//                             Divider(
//                               color: AppTheme.figmaPurple,
//                               height: 18,
//                               thickness: 2,
//                             ),
//                             SizedBox(
//                               height: 12,
//                             )
//                           ],
//                         ),
//                       if (collection != null)
//                         ...collection
//                             .getForm()
//                             .map((value) => buildInput(value))
//                             .toList()
//                       else if (model != null)
//                         ...model
//                             .getForm()
//                             .map((value) => buildInput(value))
//                             .toList(),
//                     ])),
//               ]),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   buildSegPage(context, EngageParseObject collection) {
//     List<QuickAdd> form = collection.getForm();
//     List<QuickAddSegment> formSegment = collection.getSegmentForm();

//     final segmentList = buildSegments(formSegment);
//     return Scaffold(
//       appBar: showAppBar
//           ? AppBar(
//               title: Text((collection.objectId != null ? 'Edit ' : 'Create ') +
//                   collection.tableName),
//             )
//           : null,
//       body: LoadingOverlay(
//         isLoading: isLoading,
//         child: Container(
//           // padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 14,
//               ),
//               CupertinoSlidingSegmentedControl(
//                 backgroundColor: Colors.purpleAccent,
//                 thumbColor: AppTheme.figmaPurple,
//                 onValueChanged: (value) =>
//                     setState(() => currentSegment = value),
//                 children: segmentList,
//                 groupValue: currentSegment,
//               ),
//               if (form.length > 0 && currentSegment == 0)
//                 Expanded(child: buildSinglePage(context, collection, false)),
//               ...formSegment.map((value) {
//                 if (form.length > 0 && currentSegment == value.index) {
//                   return Expanded(child: quickSegList(context, value));
//                 }
//                 return Text('');
//               }).toList(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   buildTabPage(context, EngageParseObject collection) {
//     List<QuickAddTab> formTab = collection.getTabForm();
//     return DefaultTabController(
//       length: formTab.length,
//       child: Scaffold(
//         appBar: showAppBar
//             ? AppBar(
//                 title: Text(
//                     (collection.objectId != null ? 'Edit ' : 'Create ') +
//                         collection.tableName),
//                 bottom: TabBar(
//                   tabs: [
//                     ...formTab
//                         .map((tab) => Tab(
//                               text: tab.name,
//                             ))
//                         .toList()
//                   ],
//                 ),
//               )
//             : null,
//         body: LoadingOverlay(
//           isLoading: isLoading,
//           child: TabBarView(
//             children: [
//               ...formTab.map((value) {
//                 if (value.type == 'form') {
//                   return buildSinglePage(context, value.collection, false);
//                 } else {
//                   return quickList(context, value);
//                 }
//               }).toList(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   quickList(context, value) {
//     return Container(
//         padding: const EdgeInsets.all(16.0),
//         child: QuickList(
//           collection: value.collection,
//           parent: value.parent,
//           onTap: (item) => Get.toNamed(addRoute, arguments: {
//             'collection': item,
//             'parent': value.parent,
//             'addRoute': addRoute,
//             'project': project,
//           }),
//         ));
//   }

//   quickSegList(context, QuickAddSegment value) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         heroTag: 'quickSegList',
//         child: Icon(Icons.add),
//         onPressed: () async {
//           await addSegItem(value);
//           setState(() {
//             collection = collection;
//           });
//         },
//       ),
//       body: Container(
//         child: value == null || value.list == null || value.list.isEmpty
//             ? Center(
//                 child: Text('Empty. Add Something!',
//                     style: TextStyle(fontSize: 22)))
//             : ListView.builder(
//                 itemCount: value.list.length,
//                 itemBuilder: (context, index) {
//                   var item = value.list[index];
//                   return Column(
//                     children: <Widget>[
//                       ListTile(
//                         leading: item.image != null
//                             ? Image.network(item.image.url)
//                             : null,
//                         onTap: () async {
//                           await Get.toNamed(addRoute, arguments: {
//                             'model': item,
//                             'parent': value.parent,
//                             'arrayToSave': value.name.toLowerCase(),
//                             'addRoute': addRoute,
//                             'project': project,
//                           });
//                           setState(() {
//                             collection = collection;
//                           });
//                         },
//                         title: Text(item.name,
//                             style: project != null && project.darkMode == true
//                                 ? TextStyle(color: project.white)
//                                 : null),
//                       ),
//                       Divider(height: 1, color: Colors.grey, thickness: 1)
//                     ],
//                   );
//                 },
//               ),
//       ),
//     );
//   }

//   buildInput(QuickAdd qa) {
//     return EngageInput(
//       margin: qa.margin,
//       hintText: qa.hintText,
//       labelText: qa.labelText,
//       helperText: qa.helperText,
//       type: qa.type,
//       initialValue: qa.initialValue,
//       error: qa.error,
//       inputType: qa.inputType,
//       inputAction: qa.inputAction,
//       // fileType: qa.fileType,
//       autofocus: qa.autofocus,
//       correct: qa.correct,
//       readOnly: qa.readOnly,
//       maxLines: qa.maxLines,
//       dateFormat: qa.dateFormat,
//       node: qa.node,
//       smartLeading: qa.smartLeading,
//       mask: qa.mask,
//       collection: qa.collection,
//       items: qa.items,
//       // smartOptions: qa.smartOptions,
//       onChanged: qa.onChanged,
//       onSubmitted: qa.onSubmitted,
//     );
//   }
// }