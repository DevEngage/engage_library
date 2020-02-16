import 'package:flutter/foundation.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class User with ChangeNotifier {
  ParseUser user;

  User(this.user);

  getUser() async {
    user = await ParseUser.currentUser() as ParseUser;
    return user;
  }

  Future<ParseResponse> logout() async {
    if (user == null) {
      await getUser();
    }
    ParseResponse response = await user.logout();
    user = null;
    return response;
  }

  Future<ParseResponse> login(email, password) async {
    ParseResponse response = await ParseUser(email, password, email).login();
    if (response.success) {
      await getUser();
    }
    return response;
  }

  Future<ParseResponse> signUp(email, password) async {
    ParseResponse response = await ParseUser(email, password, email).signUp();
    if (response.success) {
      await getUser();
    }
    return response;
  }

  Future<ParseResponse> anonLogin() async {
    ParseResponse response = await ParseUser(null, null, null).loginAnonymous();
    if (response.success) {
      await getUser();
    }
    return response;
  }

  Future<ParseResponse> requestPasswordReset(email) async {
    ParseResponse response =
        await ParseUser(null, null, email).requestPasswordReset();
    return response;
  }

  convertAnon() {}

  bool get isAnon => isLoggedIn && user.username == null;
  bool get isLoggedIn => user != null;
}
