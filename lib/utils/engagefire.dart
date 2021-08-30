import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage_library/models/engagefire_doc_model.dart';
import 'package:get/get.dart';

class Engagefire<T> extends GetxController {
  late String collectionPath;
  static Engagefire to = Get.find();
  Engagefire({
    required this.collectionPath,
  });

  get ref {
    FirebaseFirestore.instance.collection(collectionPath).withConverter<T>(
          fromFirestore: (snapshot, _) =>
              (T as EngagefireDocModel).fromJson(snapshot.data()!),
          toFirestore: (doc, _) => (doc as EngagefireDocModel).toJson(),
        );
  }

  getAll() {}

  save(T doc) {
    // if ()
  }

  Future getDoc(id) {
    return ref.doc(id).get();
  }
}
