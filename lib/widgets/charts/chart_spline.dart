// import 'package:consumer_mobile/models/chart_model.dart';
// import 'package:consumer_mobile/utils/app_themes.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class SplineCard extends StatefulWidget {
//   final List<SplineChartData> chartData;
//   final double yInterval;
//   const SplineCard({
//     Key? key,
//     required this.chartData,
//     this.yInterval = 200,
//   }) : super(key: key);

//   @override
//   _SplineCardState createState() => _SplineCardState();
// }

// class _SplineCardState extends State<SplineCard> {
//   _SplineCardState();

//   final List<String> _splineList =
//       <String>['natural', 'monotonic', 'cardinal', 'clamped'].toList();
//   late String _selectedSplineType;
//   late SplineType _spline;
//   late TooltipBehavior _tooltipBehavior;

//   @override
//   void initState() {
//     _selectedSplineType = 'natural';
//     _spline = SplineType.natural;
//     _tooltipBehavior =
//         TooltipBehavior(enable: true, header: '', canShowMarker: false);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _buildTypesSplineChart();
//   }

//   @override
//   Widget buildSettings(BuildContext context) {
//     return StatefulBuilder(
//         builder: (BuildContext context, StateSetter stateSetter) {
//       return Row(
//         children: <Widget>[
//           Text('Spline type ',
//               style: TextStyle(
//                 // color: model.textColor,
//                 fontSize: 16,
//               )),
//           Container(
//             padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//             height: 50,
//             alignment: Alignment.bottomLeft,
//             child: DropdownButton<String>(
//                 underline: Container(color: const Color(0xFFBDBDBD), height: 1),
//                 value: _selectedSplineType,
//                 items: _splineList.map((String value) {
//                   return DropdownMenuItem<String>(
//                     value: (value != null) ? value : 'natural',
//                     child: Text(
//                       value,
//                       style: TextStyle(
//                           // color: model.textColor,
//                           ),
//                     ),
//                   );
//                 }).toList(),
//                 onChanged: (dynamic value) {
//                   _onPositionTypeChange(value.toString());
//                   stateSetter(() {});
//                 }),
//           ),
//         ],
//       );
//     });
//   }

//   /// Returns the spline types chart.
//   SfCartesianChart _buildTypesSplineChart() {
//     return SfCartesianChart(
//       plotAreaBorderWidth: 0,
//       title: ChartTitle(text: ''),
//       primaryXAxis: NumericAxis(
//         majorGridLines: const MajorGridLines(width: 0),
//         interval: 1,
//         isVisible: false,
//       ),
//       primaryYAxis: NumericAxis(
//           labelFormat: '\${value}k',
//           // minimum: -0.1,
//           // maximum: 0.2,
//           axisLine: AxisLine(width: 0),
//           majorGridLines: MajorGridLines(
//               dashArray: [1.2, 3.0], color: Color(0xFFE3EBF6), width: 1.5),
//           interval: widget.yInterval,
//           majorTickLines: const MajorTickLines(size: 0)),
//       series: _getSplineTypesSeries(),
//       tooltipBehavior: _tooltipBehavior,
//     );
//   }

//   /// Returns the list of chart series which need to render on the spline chart.
//   List<SplineSeries<SplineChartData, num>> _getSplineTypesSeries() {
//     return <SplineSeries<SplineChartData, num>>[
//       SplineSeries<SplineChartData, num>(
//           color: AppThemes.primaryColor,
//           splineType: _spline,
//           dataSource: widget.chartData,
//           xValueMapper: (SplineChartData sales, _) => sales.x,
//           yValueMapper: (SplineChartData sales, _) => sales.y,
//           width: 2)
//     ];
//   }

//   /// Method to change the spline type using dropdown menu.
//   void _onPositionTypeChange(String item) {
//     _selectedSplineType = item;
//     if (_selectedSplineType == 'natural') {
//       _spline = SplineType.natural;
//     }
//     if (_selectedSplineType == 'monotonic') {
//       _spline = SplineType.monotonic;
//     }
//     if (_selectedSplineType == 'cardinal') {
//       _spline = SplineType.cardinal;
//     }
//     if (_selectedSplineType == 'clamped') {
//       _spline = SplineType.clamped;
//     }
//     setState(() {
//       /// update the spline type changes
//     });
//   }
// }