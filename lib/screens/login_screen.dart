import 'package:engage_library/controllers/user_controller.dart';
import 'package:engage_library/screens/home_screen.dart';
import 'package:engage_library/widgets/confirm_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class EngageLoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  _checkForUser(context) async {
    if (FirebaseAuth.instance.currentUser != null) {
      await Navigator.pushNamed(context, '/home');
    }
  }

  Future<String?> register(EngageUserController user, email, password) async {
    return await user.signUp(email, password);
  }

  Future<String?> login(EngageUserController user, email, password) async {
    return await user.login(email, password);
  }

  skipLogin(context, EngageUserController user) async {
    engagedConfirmWidget(context,
        title: 'Warning!',
        message:
            'Your data will not be saved to an account and will be invalid after 1 year.',
        onAgreed: () async {
      await user.loginAnonAccount();
      await _checkForUser(context);
    });
  }

  Future<String?> _recoverPassword(
      EngageUserController user, String name) async {
    // final res = await user.requestPasswordReset(name);
    // if (!res.success) return res.error.message;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final EngageUserController usersController =
        Get.put(EngageUserController());
    return Scaffold(
      body: FlutterLogin(
        title: 'EarnIt',
        logo: 'assets/icons/logo_gold.png',
        onLogin: (LoginData data) async =>
            await login(usersController, data.name.trim(), data.password),
        onSignup: (LoginData data) async =>
            await register(usersController, data.name.trim(), data.password),
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => EngageHomeScreen(),
          ));
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
