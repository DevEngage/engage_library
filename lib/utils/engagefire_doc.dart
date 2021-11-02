import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage_library/models/engagefire_doc_model.dart';
import 'package:engage_library/utils/engagefire.dart';
import 'package:engage_library/utils/engagefire_collection.dart';
import 'package:flutter/material.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart'
    show JsonMapper, jsonSerializable, JsonProperty;
import 'dart:convert';

@jsonSerializable
class EngagefireDoc<T> {
  @JsonProperty(ignoreForSerialization: true)
  late EngagefireCollection $parent;

  @JsonProperty(name: '_path')
  late String $path;

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
  DocumentReference<dynamic> get $ref => $parent.$ref.doc(id);

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

  Future<void> $save() async {
    if (id == null) {
      id = $ref.id;
    }
    await $ref.set($toMap(), SetOptions(merge: true));
  }

  $delete() async {
    return await $ref.delete();
  }

  $updateSearchCache() {
    // cache
  }

  Future<bool> $toggle(String field) async {
    // await parent?.doc(task.id).update({
    //   ...task.toJson(),
    //   'isDone': !task.isDone,
    // });
    // $toJson();
    await $save();
    return true;
  }

  $count(field) {}

  // doc = doc.$refres();
  $refresh() {
    if (id != null) {
      return $parent.getDoc(id);
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

  $fromJson(data, [id]) {
    if (id != null) {
      data['id'] = id;
    }
    return JsonMapper.deserialize<T>(jsonEncode(data));
  }

  $fromFirestore(data, [id]) {
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
