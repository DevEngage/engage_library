import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class Engagefire {
  static late FirebaseFirestore firestore;

  Engagefire();

  static init({useEmulatorOnLocal = true}) {
    if (!kReleaseMode) {
      FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
      FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
      FirebaseStorage.instance.useStorageEmulator('localhost', 9199);
      FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    }
    firestore = FirebaseFirestore.instance;
  }
}
