// import 'package:flutter/material.dart';

// class EngageThemeBuilder {
//   final Color primaryColor;
//   final Color secondaryColor;
//   final Color backgroundColor;
//   final Color topBarColor;
//   EngageThemeBuilder({
//     required this.primaryColor,
//     required this.secondaryColor,
//     required this.backgroundColor,
//     required this.topBarColor,
//   });

//   getTextTheme() {
//     return TextTheme(
//       headline1: TextStyle(
//           fontSize: 20.0,
//           color: Color(0xFFE4EBF6),
//           fontWeight: FontWeight.w600),
//       headline2: TextStyle(fontSize: 12.0, color: Color(0xFFB1C2D9)),
//       headline3: TextStyle(fontSize: 26.0, color: Color(0xFFE4EBF6)),
//       bodyText1: TextStyle(fontSize: 14.0, color: Color(0xFFE4EBF6)),
//       bodyText2: TextStyle(fontSize: 10.0, color: Colors.grey),
//       button: TextStyle(
//           fontSize: 15.0, color: _lightTextColor, fontWeight: FontWeight.w600),
//       headline6: TextStyle(fontSize: 16.0, color: _lightTextColor),
//       subtitle1: TextStyle(fontSize: 16.0, color: _lightTextColor),
//       caption: TextStyle(fontSize: 12.0, color: _lightBackgroundAppBarColor),
//     );
//   }

//   getDarkTheme() {
//     return ThemeData(
//       brightness: Brightness.dark,
//       //primarySwatch: _darkPrimaryColor, //cant be Color on MaterialColor so it can compute different shades.
//       primaryColor: primaryColor,
//       fontFamily: font1,
//       scaffoldBackgroundColor: _darkBackgroundColor,
//       backgroundColor: _darkBackgroundColor,
//       floatingActionButtonTheme: FloatingActionButtonThemeData(
//         backgroundColor: _darkPrimaryColor,
//       ),
//       appBarTheme: AppBarTheme(
//         color: _darkBackgroundColor,
//         iconTheme: IconThemeData(color: Color(0xFFB1C2D9)),
//         textTheme: _darkTextTheme,
//       ),
//       colorScheme: ColorScheme.dark(
//         primary: _darkPrimaryColor,
//         primaryVariant: _darkBackgroundColor,

//         // secondary: _darkSecondaryColor,
//       ),
//       snackBarTheme: SnackBarThemeData(
//         contentTextStyle: TextStyle(color: Colors.white),
//         backgroundColor: _darkBackgroundAlertColor,
//         actionTextColor: _darkBackgroundActionTextColor,
//       ),
//       // iconTheme: IconThemeData(
//       //   color: _darkIconColor, //_darkIconColor,
//       // ),
//       popupMenuTheme: PopupMenuThemeData(color: _darkBackgroundAppBarColor),
//       textTheme: _darkTextTheme,
//       buttonTheme: ButtonThemeData(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//         buttonColor: _darkPrimaryColor,
//         textTheme: ButtonTextTheme.primary,
//       ),
//       unselectedWidgetColor: _darkPrimaryColor,
//       inputDecorationTheme: InputDecorationTheme(
//         prefixStyle: TextStyle(color: _darkIconColor),
//         //labelStyle: TextStyle(color: nevada),
//         border: OutlineInputBorder(
//             borderSide: BorderSide(width: 1.0),
//             borderRadius: BorderRadius.all(
//               Radius.circular(8.0),
//             )),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: _darkBorderColor, width: 1.0),
//           borderRadius: BorderRadius.all(Radius.circular(8.0)),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: _darkBorderActiveColor),
//           borderRadius: BorderRadius.all(Radius.circular(8.0)),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: _darkBorderErrorColor),
//           borderRadius: BorderRadius.all(Radius.circular(8.0)),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: _darkBorderErrorColor),
//           borderRadius: BorderRadius.all(Radius.circular(8.0)),
//         ),
//         fillColor: _darkInputFillColor,
//         //focusColor: _darkBorderActiveColor,
//       ),
//       dataTableTheme: DataTableThemeData(
//         dataTextStyle: TextStyle(fontSize: 10, color: Color(0xFFE4EBF6)),
//         headingRowColor: MaterialStateProperty.all(darkBlue),
//         headingTextStyle: TextStyle(fontSize: 10, color: Color(0xFF8492A6)),
//         columnSpacing: 20.0,
//       ),
//       dividerColor: Color(0xFFEDF2F9),
//       // iconTheme: IconThemeData(
//       //   color: Color(0xFF3B516C),
//       // ),
//       bottomAppBarTheme: BottomAppBarTheme(
//         color: Color(0xFF95AAC9),
//       ),
//       bottomNavigationBarTheme: BottomNavigationBarThemeData(
//         backgroundColor: grayBlue,
//         selectedItemColor: white,
//         unselectedItemColor: Color(0xFF95AAC9),
//         selectedLabelStyle: TextStyle(fontSize: 11),
//         unselectedLabelStyle: TextStyle(
//           color: Color(0xFF95AAC9),
//         ),
//       ),
//       bottomAppBarColor: Color(0xFF95AAC9),
//       cardColor: grayBlue,
//       cardTheme: CardTheme(
//         shape: RoundedRectangleBorder(
//           side: BorderSide(color: grayBlue, width: 1),
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       iconTheme: IconThemeData(color: Color(0xFFB1C2D9)),
//     );
//   }
// }
