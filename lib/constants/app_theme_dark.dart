// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static const Color primaryColor = Color(0xFF2C7BE5);
  static const Color secondaryColor = Color(0xFFff5757);
  static const Color accentColor = Color(0xFF56FFE1);
  static const Color backgroundColor = Color(0xFFE5E5E5);
  static const Color topBarColor = Color(0xFFE5E5E5);
  static const Color darkColor = Color(0xFF000000);
  static const Color cardOutline = Color(0xFFE3EBF6);
  static const Color grayIcon = Color(0xFF3B516C);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grayBlue = Color(0xFF283E59);
  static const Color darkBlue = Color(0xFF12263F);
  static const Color pureBlack = Color(0xFF000000);

  static const Color figmaPink = Color(0xFFE63757);
  static const Color figmaPurple = Color(0xFF8256FF);
  static const Color figmaGreen = Color(0xFF56FFE1);
  static const Color figmaGray = Color(0xFFDEE0EA);
  static const Color figmaDark = Color(0xFF343A47);
  static const Color figmaWhite = Color(0xFFFFFFFF);
  static const Color figmaYellow = Color(0xFFFFCE51);
  static const Color figmaLightGreen = Color(0xFF56FFE1);
  static const Color figmaDarkPurple = Color(0xFF5621AB);
  static const Color figmaDeepDarkPurple = Color(0xFF5621AB);
  static const Color figmaMidDark = Color(0xFF424858);
  static const Color figmaBlackDark = Color(0xFF282C36);
  static const Color figmaBlack = Color(0xFF000000);

  static const Color figmaBrightPurple = Color(0xFF6A3CCD);
  static const Color colorBlackOpacity5 = Color.fromRGBO(0, 0, 0, .50);
  static const Color colorBlackOpacity8 = Color.fromRGBO(0, 0, 0, .80);
  static const Color colorBlackOpacity9 = Color.fromRGBO(0, 0, 0, .90);
  static Color colorRedOpacity8 = Color(0xFFff5757).withOpacity(0.8);
  static Color colorGreenOpacity8 = Colors.cyan[600]!.withOpacity(0.8);

  static const Color colorPurple = Color.fromRGBO(106, 60, 205, 1);
  static const Color colorOrange = Color.fromRGBO(242, 89, 3, 1);
  static const Color colorRed = Color(0xFFff5757);

  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color background = figmaDark;
  static const Color nearlyDarkBlue = Color(0xFF2633C5);

  static const Color nearlyBlue = Color(0xFF00B6F0);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color spacer = Color(0xFFF2F2F2);
  static const Color transparent = Colors.transparent;

  static String font1 = "ProductSans";
  static String font2 = "Roboto";
  //constants color range for light theme
  //main color
  static const Color _lightPrimaryColor = primaryColor;

  //Background Colors
  static const Color _lightBackgroundColor = backgroundColor;
  static const Color _lightBackgroundAppBarColor = topBarColor;
  static const Color _lightBackgroundSecondaryColor = white;
  static const Color _lightBackgroundAlertColor = nearlyBlack;
  static const Color _lightBackgroundActionTextColor = white;
  static const Color _lightBackgroundErrorColor = figmaPink;
  static const Color _lightBackgroundSuccessColor = figmaLightGreen;

  //Text Colors
  static const Color _lightTextColor = Color(0xFF3B516C);
  static const Color _lightAlertTextColor = Colors.black;
  static const Color _lightTextSecondaryColor = Colors.black;

  //Border Color
  static const Color _lightBorderColor = figmaDarkPurple;

  //Icon Color
  static const Color _lightIconColor = figmaDarkPurple;

  //form input colors
  static const Color _lightInputFillColor = _lightBackgroundSecondaryColor;
  static const Color _lightBorderActiveColor = _lightPrimaryColor;
  static const Color _lightBorderErrorColor = figmaPink;

  //constants color range for dark theme
  static const Color _darkPrimaryColor = primaryColor;

  //Background Colors
  static const Color _darkBackgroundColor = Color(0xFF12263F);
  static const Color _darkBackgroundAppBarColor = topBarColor;
  static const Color _darkBackgroundSecondaryColor =
      Color.fromRGBO(0, 0, 0, .6);
  static const Color _darkBackgroundAlertColor = nearlyBlack;
  static const Color _darkBackgroundActionTextColor = white;

  static const Color _darkBackgroundErrorColor =
      Color.fromRGBO(255, 97, 136, 1);
  static const Color _darkBackgroundSuccessColor =
      Color.fromRGBO(186, 215, 97, 1);

  static const Color _darkTextColor = Colors.white;
  static const Color _darkAlertTextColor = Colors.black;
  static const Color _darkTextSecondaryColor = Colors.black;

  static const Color _darkBorderColor = figmaDarkPurple;

  static const Color _darkIconColor = Color(0xFFB1C2D9);

  static const Color _darkInputFillColor = _darkBackgroundSecondaryColor;
  static const Color _darkBorderActiveColor = _darkPrimaryColor;
  static const Color _darkBorderErrorColor = figmaPink;

  static final TextTheme _darkTextTheme = TextTheme(
    headline1: TextStyle(
        fontSize: 20.0, color: Color(0xFFE4EBF6), fontWeight: FontWeight.w600),
    headline2: TextStyle(fontSize: 12.0, color: Color(0xFFB1C2D9)),
    headline3: TextStyle(fontSize: 26.0, color: Color(0xFFE4EBF6)),
    bodyText1: TextStyle(fontSize: 14.0, color: Color(0xFFE4EBF6)),
    bodyText2: TextStyle(fontSize: 10.0, color: Colors.grey),
    button: TextStyle(
        fontSize: 15.0, color: _lightTextColor, fontWeight: FontWeight.w600),
    headline6: TextStyle(fontSize: 16.0, color: _lightTextColor),
    subtitle1: TextStyle(fontSize: 16.0, color: _lightTextColor),
    caption: TextStyle(fontSize: 12.0, color: _lightBackgroundAppBarColor),
  );

  //the dark theme
  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        //primarySwatch: _darkPrimaryColor, //cant be Color on MaterialColor so it can compute different shades.
        accentColor: _darkPrimaryColor, //prefix icon color form input on focus
        primaryColor: primaryColor,
        fontFamily: font1,
        scaffoldBackgroundColor: _darkBackgroundColor,
        backgroundColor: _darkBackgroundColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: _darkPrimaryColor,
        ),
        appBarTheme: AppBarTheme(
          color: _darkBackgroundColor,
          iconTheme: IconThemeData(color: Color(0xFFB1C2D9)),
          textTheme: _darkTextTheme,
        ),
        colorScheme: ColorScheme.dark(
          primary: _darkPrimaryColor,
          primaryVariant: _darkBackgroundColor,

          // secondary: _darkSecondaryColor,
        ),
        snackBarTheme: SnackBarThemeData(
          contentTextStyle: TextStyle(color: Colors.white),
          backgroundColor: _darkBackgroundAlertColor,
          actionTextColor: _darkBackgroundActionTextColor,
        ),
        // iconTheme: IconThemeData(
        //   color: _darkIconColor, //_darkIconColor,
        // ),
        popupMenuTheme: PopupMenuThemeData(color: _darkBackgroundAppBarColor),
        textTheme: _darkTextTheme,
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          buttonColor: _darkPrimaryColor,
          textTheme: ButtonTextTheme.primary,
        ),
        unselectedWidgetColor: _darkPrimaryColor,
        inputDecorationTheme: InputDecorationTheme(
          prefixStyle: TextStyle(color: _darkIconColor),
          //labelStyle: TextStyle(color: nevada),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              )),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: _darkBorderColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: _darkBorderActiveColor),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: _darkBorderErrorColor),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: _darkBorderErrorColor),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          fillColor: _darkInputFillColor,
          //focusColor: _darkBorderActiveColor,
        ),
        dataTableTheme: DataTableThemeData(
          dataTextStyle: TextStyle(fontSize: 10, color: Color(0xFFE4EBF6)),
          headingRowColor: MaterialStateProperty.all(darkBlue),
          headingTextStyle: TextStyle(fontSize: 10, color: Color(0xFF8492A6)),
          columnSpacing: 20.0,
        ),
        dividerColor: Color(0xFFEDF2F9),
        // iconTheme: IconThemeData(
        //   color: Color(0xFF3B516C),
        // ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Color(0xFF95AAC9),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: grayBlue,
          selectedItemColor: white,
          unselectedItemColor: Color(0xFF95AAC9),
          selectedLabelStyle: TextStyle(fontSize: 11),
          unselectedLabelStyle: TextStyle(
            color: Color(0xFF95AAC9),
          ),
        ),
        bottomAppBarColor: Color(0xFF95AAC9),
        cardColor: grayBlue,
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: grayBlue, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        iconTheme: IconThemeData(color: Color(0xFFB1C2D9)),
      );
}
