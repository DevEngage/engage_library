import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage_library/models/engagefire_doc_model.dart';
import 'package:engage_library/utils/engagefire.dart';
import 'package:engage_library/utils/engagefire_collection.dart';
import 'package:flutter/material.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart'
    show JsonMapper, jsonSerializable, JsonProperty;

@jsonSerializable
class EngagefireDoc {
  @JsonProperty(ignoreForSerialization: true)
  late EngagefireCollection parent;

  @JsonProperty(name: 'id')
  String? id;

  EngagefireDoc({
    required dynamic path,
  }) {
    if (path is String) {
      this.parent = EngagefireCollection(path: path);
    } else {
      this.parent = path;
    }
  }

  get ref {
    FirebaseFirestore.instance.collection('').doc(id).withConverter(
          fromFirestore: (snapshot, _) =>
              fromJson(snapshot.data()!, snapshot.id),
          toFirestore: (doc, _) => toJson(),
        );
  }

  stream() {
    return StreamBuilder<DocumentSnapshot>(
        stream: ref.snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            final item = snapshot.data!.data()!;
          }
          return Container();
        });
  }

  addMeta() {
    if (this is EngagefireDocModel) {
      (this as EngagefireDocModel).updatedAt =
          DateTime.now().millisecondsSinceEpoch;
      (this as EngagefireDocModel).createdAt =
          DateTime.now().millisecondsSinceEpoch;
    }
  }

  save() async {
    if (id != null) {
      // update
      await parent.ref.update(toJson());
    } else {
      // add
      await parent.ref.set(toJson());
    }
  }

  updateSearchCache() {
    // cache
  }

  toggle(String field) async {
    // await parent?.doc(task.id).update({
    //   ...task.toJson(),
    //   'isDone': !task.isDone,
    // });=
    await save();
  }

  count(field) {}

  refresh() {
    if ((this as EngagefireDocModel).id != null) {
      parent.getDoc((this as EngagefireDocModel).id);
    }
  }

  incField([value = 1]) {}

  toJson() {
    print(this);
    Object m = JsonMapper.serialize(this);
    print(m);
    return m;
  }

  fromJson(data, [id]) {
    if (id != null) {
      data['id'] = id;
    }
    return JsonMapper.deserialize(data);
  }

  // getFireImage() async {
  //   final ref =
  //       firebase_storage.FirebaseStorage.instance.ref('${widget.imageRef}');
  //   final imageBytes = await ref.getData(10000000);
  //   return Image.memory(imageBytes!);
  // }
}
