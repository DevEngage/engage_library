import 'package:EarnIt/providers/user_provider.dart';
import 'package:EarnIt/screens/home_screen.dart';
import 'package:EarnIt/widgets/confirm_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  _checkForUser(context) async {
    print(await ParseUser.currentUser());
    if (await ParseUser.currentUser() != null) {
      await Navigator.pushNamed(context, '/home');
    }
  }

  Future<String> register(User user, email, password) async {
    final res = await user.signUp(email, password);
    if (!res.success) return res.error.message;
  }

  Future<String> login(User user, email, password) async {
    final res = await user.login(email, password);
    if (!res.success) return res.error.message;
  }

  skipLogin(context, User user) async {
    confirmWidget(context,
        title: 'Warning!',
        message:
            'Your data will not be saved to an account and will be invalid after 1 year.',
        onAgreed: () async {
      await user.anonLogin();
      await _checkForUser(context);
    });
  }

  Future<String> _recoverPassword(User user, String name) async {
    final res = await user.requestPasswordReset(name);
    if (!res.success) return res.error.message;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: false);
    return Scaffold(
      body: FlutterLogin(
        title: 'EarnIt',
        logo: 'assets/icons/logo_gold.png',
        onLogin: (LoginData data) async =>
            await login(user, data.name.trim(), data.password),
        onSignup: (LoginData data) async =>
            await register(user, data.name.trim(), data.password),
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
        },
        onRecoverPassword: (String name) => _recoverPassword(user, name),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  onPressed: () => skipLogin(context, user),
                  child: Text('Skip Login')),
            ],
          ),
        ),
      ),
    );
  }
}
