// import 'package:engage_library/classes/project.dart';
// import 'package:engage_library/providers/user_provider.dart';
// import 'package:engage_library/screens/home_screen.dart';
// import 'package:engage_library/widgets/confirm_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_login/flutter_login.dart';
// import 'package:get/get.dart';
// import 'package:parse_server_sdk/parse_server_sdk.dart';
// import 'package:provider/provider.dart';

// class LoginScreen extends StatelessWidget {
//   Duration get loginTime => Duration(milliseconds: 2250);
//   EngageProject project;
//   LoginScreen({this.project}) {
//     if (project == null) project = EngageProject();
//   }

//   _checkForUser() async {
//     print(await ParseUser.currentUser());
//     if (await ParseUser.currentUser() != null) {
//       await Get.offNamed('/home');
//     }
//   }

//   Future<String> register(UserProvider user, email, password) async {
//     final res = await user.signUp(email, password);
//     if (!res.success) return res.error.message;
//     return null;
//   }

//   Future<String> login(UserProvider user, email, password) async {
//     final res = await user.login(email, password);
//     if (!res.success) return res.error.message;
//     return null;
//   }

//   skipLogin(context, UserProvider user) async {
//     confirmWidget(context,
//         title: 'Warning!',
//         message:
//             'Your data will not be saved to an account and will be invalid after 1 year.',
//         onAgreed: () async {
//       await user.anonLogin();
//       await _checkForUser();
//     });
//   }

//   Future<String> _recoverPassword(UserProvider user, String name) async {
//     final res = await user.requestPasswordReset(name);
//     if (!res.success) return res.error.message;
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<UserProvider>(context, listen: false);
//     return Scaffold(
//       backgroundColor: project.theme().primaryColor,
//       body: FlutterLogin(
//         theme: project.loginTheme(),
//         title: project.name,
//         // logo: 'assets/icon/logo-icon.png',
//         onLogin: (LoginData data) async =>
//             await login(user, data.name.trim(), data.password),
//         onSignup: project.allowSignup == null
//             ? null
//             : (LoginData data) async =>
//                 await register(user, data.name.trim(), data.password),
//         onSubmitAnimationCompleted: () {
//           Navigator.of(context).pushReplacement(MaterialPageRoute(
//             builder: (context) => HomeScreen(),
//           ));
//         },
//         onRecoverPassword: (String name) => _recoverPassword(user, name),
//       ),
//     );
//   }
// }
