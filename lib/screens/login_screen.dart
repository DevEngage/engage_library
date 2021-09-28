import 'package:engage_library/controllers/user_controller.dart';
import 'package:engage_library/widgets/confirm_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

class EngageLoginScreen extends StatelessWidget {
  final String? title;
  final String? logo;
  final String loginRoute;
  final String signupRoute;
  bool isLogin = true;
  EngageLoginScreen({
    this.title,
    this.logo,
    this.loginRoute = '/',
    this.signupRoute = '/',
  });

  Duration get loginTime => Duration(milliseconds: 2250);

  _checkForUser(context) async {
    if (FirebaseAuth.instance.currentUser != null) {
      await Get.offAllNamed('/');
    }
  }

  Future<String?> register(EngageUserController user, email, password) async {
    isLogin = false;
    return await user.signUp(email, password);
  }

  Future<String?> login(EngageUserController user, email, password) async {
    isLogin = true;
    return await user.login(email, password);
  }

  skipLogin(context, EngageUserController user) async {
    engageConfirmWidget(context,
        title: 'Warning!',
        message:
            'Your data will not be saved to an account and will be invalid after 90 days.',
        onAgreed: () async {
      await user.loginAnonAccount();
      await _checkForUser(context);
    });
  }

  Future<String?> _recoverPassword(
      EngageUserController user, String name) async {
    final res = await user.requestPasswordReset(name);
    if (!res.success) return res.error.message;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final EngageUserController usersController =
        Get.put(EngageUserController());
    return Scaffold(
      body: FlutterLogin(
        title: title,
        logo: logo,
        onLogin: (LoginData data) async =>
            await login(usersController, data.name.trim(), data.password),
        onSignup: (LoginData data) async =>
            await register(usersController, data.name.trim(), data.password),
        onSubmitAnimationCompleted: () {
          if (isLogin) {
            return Get.offAllNamed(loginRoute);
          } else {
            return Get.toNamed(signupRoute);
          }
        },
        onRecoverPassword: (String name) =>
            _recoverPassword(usersController, name),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  onPressed: () => skipLogin(context, usersController),
                  child: Text('Skip Login')),
            ],
          ),
        ),
      ),
    );
  }
}
