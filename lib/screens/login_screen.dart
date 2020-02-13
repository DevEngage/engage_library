import 'package:EarnIt/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  _checkForUser(context) async {
    print(await ParseUser.currentUser());
    if (await ParseUser.currentUser() != null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    }
  }

  Future register(email, password) async {
    // final user = BackendlessUser()
    //     ..email = email
    //     ..password = password;
    //     // ..setProperty("name", _nameController.text);
    // try {
    //   await Backendless.userService.register(user);
    // } catch (err) {
    //   print(err);
    //   return err.message;
    // }
  }

  Future login(email, password) async {
    // try {
    //   await Backendless.userService.login(email, password, true);
    // } catch (err) {
    //   print(err);
    //   return err.message;
    // }
  }

  // var apiResponse = await ParseObject('Goal').getAll();
  // print(apiResponse.result);
  // print(Parse().hasParseBeenInitialized());
  skipLogin(context) async {
    try {
      await ParseUser(null, null, null).loginAnonymous();
      await _checkForUser(context);
    } catch (err) {
      print(err);
    }
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      // if (!users.containsKey(name)) {
      //   return 'Username not exists';
      // }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        title: 'EarnIt',
        logo: 'assets/icons/logo_gold.png',
        onLogin: (LoginData data) async =>
            await login(data.name.trim(), data.password),
        onSignup: (LoginData data) async =>
            await register(data.name.trim(), data.password),
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
        },
        onRecoverPassword: _recoverPassword,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  onPressed: () => skipLogin(context),
                  child: Text('Skip Login')),
            ],
          ),
        ),
      ),
    );
  }
}
