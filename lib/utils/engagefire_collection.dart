import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage_library/models/engagefire_doc_model.dart';
import 'package:engage_library/utils/engagefire.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EngagefireCollection<T> extends GetxController {
  static Map<String, EngagefireCollection> instances = {};
  late String path;
  List list = [];
  EngagefireCollection({
    required this.path,
  });

  static to(String pathName) {
    final col = EngagefireCollection.instances[pathName];
    if (col != null) {
      return col;
    } else {
      instances[pathName] = EngagefireCollection(path: pathName);
      return instances[pathName];
    }
    // final userContonroller = Get.put(EngageUserController());
  }

  stream() {
    return StreamBuilder<DocumentSnapshot<T>>(
        stream: ref.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<T>> snapshot) {
          if (snapshot.hasData) {
            final item = snapshot.data!.data()!;
          }
          return Container();
        });
  }

  watchState() {
    // return GetBuilder<GoalController>(
    //       builder: (_) =>
  }

  get ref {
    FirebaseFirestore.instance.collection(path).withConverter<T>(
          fromFirestore: (snapshot, _) =>
              (T as EngagefireDocModel).fromJson(snapshot.data()!),
          toFirestore: (doc, _) => (doc as EngagefireDocModel).toJson(),
        );
  }

  refresh() {}
}
