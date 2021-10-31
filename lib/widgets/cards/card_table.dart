// import 'package:consumer_mobile/models/table_row_model.dart';
// import 'package:consumer_mobile/widgets/card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';

// class TableCard extends StatelessWidget {
//   final String title;
//   final List<String> headers;
//   final List<List<TableRowCellModel>> dataList;
//   final bool isLoading;
//   final onFilterPressed;
//   final onRefreshPressed;
//   const TableCard({
//     Key? key,
//     required this.title,
//     this.headers = const [],
//     required this.dataList,
//     this.isLoading = false,
//     this.onFilterPressed,
//     this.onRefreshPressed,
//   }) : super(key: key);

//   inicateGains(TableRowCellModel cell) {
//     if (cell.inicateGains) {
//       return TextStyle(
//           fontSize: 9,
//           color: num.parse(cell.value) < 0 ? Colors.red : Colors.green);
//     }
//     return TextStyle(fontSize: 9);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TaxbitCard(
//       padding: EdgeInsets.zero,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Container(
//               padding: EdgeInsets.only(left: 23, right: 4),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.only(top: 16, bottom: 13),
//                     child: Text(
//                       title,
//                       textAlign: TextAlign.left,
//                       style: Theme.of(context).textTheme.headline1,
//                     ),
//                   ),
//                   Wrap(
//                     children: [
//                       if (onRefreshPressed != null)
//                         IconButton(
//                           iconSize: 18,
//                           icon: Container(
//                             padding: const EdgeInsets.all(5.0),
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: const Color(0xFFE3EBF6), width: 1),
//                               borderRadius: BorderRadius.circular(4.0),
//                             ),
//                             child: Icon(
//                               FeatherIcons.refreshCcw,
//                               color: Theme.of(context).iconTheme.color,
//                             ),
//                           ),
//                           onPressed: onRefreshPressed,
//                         ),
//                       if (onFilterPressed != null)
//                         IconButton(
//                           iconSize: 18,
//                           icon: Container(
//                             padding: const EdgeInsets.all(5.0),
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: const Color(0xFFE3EBF6), width: 1),
//                               borderRadius: BorderRadius.circular(4.0),
//                             ),
//                             child: Icon(
//                               FeatherIcons.sliders,
//                               color: Theme.of(context).iconTheme.color,
//                             ),
//                           ),
//                           onPressed: onFilterPressed,
//                         ),
//                     ],
//                   ),
//                 ],
//               )),
//           Divider(
//             height: 1,
//             thickness: 1,
//           ),
//           DataTable(
//             columns: <DataColumn>[
//               for (String header in headers)
//                 DataColumn(
//                   label: Text(
//                     header,
//                   ),
//                 ),
//             ],
//             rows: <DataRow>[
//               if (!isLoading)
//                 for (List row in dataList)
//                   DataRow(
//                     cells: <DataCell>[
//                       for (TableRowCellModel cell in row)
//                         DataCell(Text(cell.value, style: inicateGains(cell))),
//                       // DataCell(IconButton(
//                       //   iconSize: 18,
//                       //   icon: Container(
//                       //     padding: const EdgeInsets.all(5.0),
//                       //     decoration: BoxDecoration(
//                       //       border: Border.all(
//                       //           color: const Color(0xFFE3EBF6), width: 1),
//                       //       borderRadius: BorderRadius.circular(4.0),
//                       //     ),
//                       //     child: Icon(
//                       //       FeatherIcons.sliders,
//                       //       color: Theme.of(context).iconTheme.color,
//                       //     ),
//                       //   ),
//                       //   onPressed: onFilterPressed,
//                       // ),)
//                     ],
//                   ),
//             ],
//           ),
//           if (isLoading)
//             Container(
//               height: 100,
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
