import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage_library/models/engagefire_doc_model.dart';
import 'package:engage_library/utils/engagefire.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EngagefireCollection<T> {
  //  extends GetxController
  static Map<String, EngagefireCollection> instances = {};
  late String path;
  List list = [];
  EngagefireCollection({
    required this.path,
  });

  static EngagefireCollection to(String pathName) {
    final col = EngagefireCollection.instances[pathName];
    if (col != null) {
      return col;
    } else {
      instances[pathName] = EngagefireCollection(path: pathName);
      return instances[pathName]!;
    }
    // final userContonroller = Get.put(EngageUserController());
  }

  stream({dynamic child, String emptyState = 'There is nothing in this list'}) {
    return StreamBuilder<QuerySnapshot<T>>(
        stream: ref.snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot<T>> snapshot) {
          if (!snapshot.hasData ||
              snapshot.data?.docs == null ||
              snapshot.data!.docs.length < 1)
            return Row(children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  // color: Colors.green,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.65),
                    borderRadius: BorderRadius.all(
                      const Radius.circular(15.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      emptyState,
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
                ),
              ),
            ]);
          else
            return Column(
              children: [
                for (var item in snapshot.data?.docs ?? []) child(item)
                // GoalItem(
                //   goal: item.data() as GoalModel,
                // )
              ],
            );
        });
  }

  watchState() {
    // return GetBuilder<GoalController>(
    //       builder: (_) =>
  }

  get ref {
    return FirebaseFirestore.instance.collection(path);
  }

  get refWithModel {
    return FirebaseFirestore.instance.collection(path).withConverter<T>(
          fromFirestore: (snapshot, _) =>
              (T as EngagefireDocModel).fromJson(snapshot.data()!),
          toFirestore: (doc, _) => (doc as EngagefireDocModel).toJson(),
        );
  }

  addBulk(List models) {
    // return refWithModel.
    // model.save();
    // add search cache
  }

  refresh() {}

  Future getDoc(id) {
    return ref.doc(id).get();
  }
}
