import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage_library/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class EngageUserController extends GetxController {
  User? user;
  EngageProfileModel? profile;
  final ref = FirebaseFirestore.instance
      .collection('profiles')
      .withConverter<EngageProfileModel>(
        fromFirestore: (snapshot, _) =>
            EngageProfileModel.fromJson(snapshot.data()!),
        toFirestore: (doc, _) => doc.toJson(),
      );
  static EngageUserController to = Get.find();

  EngageUserController();
  @override
  void onReady() async {
    super.onReady();
    init();
  }

  @override
  void onClose() {
    super.onClose();
  }

  init() {
    FirebaseAuth.instance.authStateChanges().listen((User? _user) {
      if (_user == null) {
        print('User is currently signed out!');
      } else {
        user = _user;
        getProfile();
        print('User is signed in!');
      }
    });
  }

  getProfile() async {
    profile = (await ref.doc(user?.uid).get()).data();
    update();
    return profile;
  }

  getUser() {
    return FirebaseAuth.instance.currentUser;
  }

  Future<void> logout() async {
    return await FirebaseAuth.instance.signOut();
  }

  Future<String?> login(email, password) async {
    try {
      // UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return 'Wrong password provided for that user.';
      }
    }
  }

  Future<String?> signUp(email, password) async {
    try {
      if (user == null) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        final AuthCredential emailcredentials =
            EmailAuthProvider.credential(email: email, password: password);
        await user!.linkWithCredential(emailcredentials);
      }
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return 'The account already exists for that email.';
      }
    } catch (e) {
      print(e);
    }
  }

  loginAnonAccount() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    // auth.currentUser?.isAnonymous;
    if (auth.currentUser == null) {
      return await FirebaseAuth.instance.signInAnonymously();
    }
    return null;
  }

  isAdmin() {
    return FirebaseAuth.instance.currentUser?.email
            ?.contains("bunnystrike.com") ==
        true;
  }

  Future requestPasswordReset(email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    Get.snackbar('Success', 'Password has been reset');
  }

  convertAnon() {}

  // bool get isAnon => isLoggedIn && user.username == null;
  bool get isLoggedIn => FirebaseAuth.instance.currentUser != null;
}
