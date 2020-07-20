import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

export 'package:engage_library/classes/quick_add.dart';

class EngageProject {
  final Color figmaPink = Color(0xFFFF565C);
  final Color figmaPurple = Color(0xFF8256FF);
  final Color figmaGreen = Color(0xFF56FFE1);
  final Color figmaGray = Color(0xFFDEE0EA);
  final Color figmaDark = Color(0xFF343A47);
  final Color figmaWhite = Color(0xFFFFFFFF);
  final Color figmaYellow = Color(0xFFFFCE51);
  final Color figmaLightGreen = Color(0xFF56FFE1);
  final Color figmaDarkPurple = Color(0xFF5621AB);
  final Color figmaMidDark = Color(0xFF424858);
  final Color figmaBlackDark = Color(0xFF282C36);

  final Color nearlyWhite = Color(0xFFFAFAFA);
  final Color white = Color(0xFFFFFFFF);
  final Color background = Color(0xFF343A47);
  final Color nearlyDarkBlue = Color(0xFF2633C5);

  final Color nearlyBlue = Color(0xFF00B6F0);
  final Color nearlyBlack = Color(0xFF213333);
  final Color grey = Color(0xFF3A5160);
  final Color dark_grey = Color(0xFF313A44);

  final Color darkText = Color(0xFF253840);
  final Color darkerText = Color(0xFF17262A);
  final Color lightText = Color(0xFF4A6572);
  final Color deactivatedText = Color(0xFF767676);
  final Color dismissibleBackground = Color(0xFF364A54);
  final Color spacer = Color(0xFFF2F2F2);
  final Color transparent = Colors.transparent;
  final String fontName = 'Roboto';

  final bool allowSignup = false;
  final bool darkMode = true;

  EngageProject();
  EngageProject._();

  String name = 'Admin';
  ThemeData theme() => ThemeData(
        scaffoldBackgroundColor: figmaMidDark,
        primaryColor: nearlyDarkBlue,
        accentColor: figmaGreen,
        highlightColor: figmaLightGreen,
        backgroundColor: figmaDarkPurple,
        tabBarTheme: TabBarTheme(
          labelColor: figmaWhite,
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: figmaPink,
                width: 2.0,
              ),
            ),
          ),
        ),
        //        gray: Colors.blueGrey[100],
        //        altBackground: Colors.deepPurpleAccent[700],
      );

  LoginTheme loginTheme() => LoginTheme(
        primaryColor: theme().primaryColor,
        // buttonStyle: TextStyle(backgroundColor: AppTheme.figmaDarkPurple),
      );
  // static ThemeData theme = admin.theme;
}
