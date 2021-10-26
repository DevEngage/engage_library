import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage_library/models/engagefire_doc_model.dart';
import 'package:engage_library/utils/engagefire.dart';
import 'package:engage_library/utils/engagefire_collection.dart';
import 'package:flutter/material.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart'
    show JsonMapper, jsonSerializable, JsonProperty;
import 'dart:convert';

@jsonSerializable
class EngagefireDoc {
  @JsonProperty(ignoreForSerialization: true)
  late EngagefireCollection $parent;

  // @JsonProperty(name: 'path')
  // late String $path;

  @JsonProperty(name: 'id')
  String? id;

  EngagefireDoc({
    required dynamic path,
    this.id,
  }) {
    if (path is String) {
      this.$parent = EngagefireCollection(path: path);
    } else {
      this.$parent = path;
    }
  }

  @JsonProperty(ignoreForSerialization: true)
  get $ref => $parent.$ref.doc(id);

  // .withConverter(
  //       fromFirestore: (snapshot, _) =>
  //           $fromFirestore(snapshot.data()!, snapshot.id),
  //       toFirestore: (doc, _) => $toMap(),
  //     );

  // .withConverter(
  //       fromFirestore: (snapshot, _) =>
  //           $fromJson(snapshot.data()!, snapshot.id),
  //       toFirestore: (doc, _) => $toJson(),
  //     )

  $stream() {
    return StreamBuilder<DocumentSnapshot>(
        stream: $ref.snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            final item = snapshot.data!.data()!;
          }
          return Container();
        });
  }

  $addMeta() {
    if (this is EngagefireDocModel) {
      (this as EngagefireDocModel).updatedAt =
          DateTime.now().millisecondsSinceEpoch;
      (this as EngagefireDocModel).createdAt =
          DateTime.now().millisecondsSinceEpoch;
    }
  }

  $save() async {
    // $toJson();
    // if (id != null) {
    // update
    // await $ref.update($toMap());
    // } else {
    // add
    // print($parent.$ref.doc(id).set($toJson()));
    // print($ref);
    // 'createdAt': DateTime.now(),
    // $toMap();
    print($toMap());
    return await $ref.set($toMap(), SetOptions(merge: true));
    // }
  }

  $delete() async {
    return await $ref.delete();
  }

  $updateSearchCache() {
    // cache
  }

  $toggle(String field) async {
    // await parent?.doc(task.id).update({
    //   ...task.toJson(),
    //   'isDone': !task.isDone,
    // });=
    await $save();
  }

  $count(field) {}

  $refresh() {
    if ((this as EngagefireDocModel).id != null) {
      $parent.getDoc((this as EngagefireDocModel).id);
    }
  }

  $incField([value = 1]) {}

  $toMap() {
    return jsonDecode($toJson());
  }

  $fromMap(data, [id]) {
    if (id != null) {
      id = data['id'];
    }
    return data; // JsonMapper.deserialize(data);
  }

  $toJson() {
    return JsonMapper.serialize(this);
  }

  $fromJson<T>(data, [id]) {
    if (id != null) {
      data['id'] = id;
    }
    return JsonMapper.deserialize<T>(jsonEncode(data));
  }

  $fromFirestore<T>(data, [id]) {
    if (id != null) {
      data['id'] = id;
    }
    return JsonMapper.deserialize<T>(jsonEncode(data));
  }

  // getFireImage() async {
  //   final ref =
  //       firebase_storage.FirebaseStorage.instance.ref('${widget.imageRef}');
  //   final imageBytes = await ref.getData(10000000);
  //   return Image.memory(imageBytes!);
  // }
}
