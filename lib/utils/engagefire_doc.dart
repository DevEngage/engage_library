import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage_library/models/engagefire_doc_model.dart';
import 'package:engage_library/utils/engagefire.dart';
import 'package:engage_library/utils/engagefire_collection.dart';
import 'package:flutter/material.dart';

class EngagefireDoc<T> {
  EngagefireCollection parent;
  String? id;
  late T doc;
  EngagefireDoc({
    required this.parent,
    required this.doc,
  });

  get ref {
    FirebaseFirestore.instance.collection('').doc(id).withConverter<T>(
          fromFirestore: (snapshot, _) =>
              (T as EngagefireDocModel).fromJson(snapshot.data()!),
          toFirestore: (doc, _) => (doc as EngagefireDocModel).toJson(),
        );
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

  addMeta() {
    if (doc is EngagefireDocModel) {
      (doc as EngagefireDocModel).updatedAt =
          DateTime.now().millisecondsSinceEpoch;
      (doc as EngagefireDocModel).createdAt =
          DateTime.now().millisecondsSinceEpoch;
    }
  }

  save() async {
    if ((doc as EngagefireDocModel).id != null) {
      // update
      await parent.ref.update(doc);
    } else {
      // add
      await parent.ref.set(doc);
    }
  }

  updateSearchCache() {
    // cache
  }

  toggle(String field) async {
    // await parent?.doc(task.id).update({
    //   ...task.toJson(),
    //   'isDone': !task.isDone,
    // });
    await save();
  }

  count(field) {}

  refresh() {
    if ((doc as EngagefireDocModel).id != null) {
      parent.getDoc((doc as EngagefireDocModel).id);
    }
  }

  incField([value = 1]) {}

  // getFireImage() async {
  //   final ref =
  //       firebase_storage.FirebaseStorage.instance.ref('${widget.imageRef}');
  //   final imageBytes = await ref.getData(10000000);
  //   return Image.memory(imageBytes!);
  // }
}
