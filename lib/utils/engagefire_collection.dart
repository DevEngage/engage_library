import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage_library/models/engagefire_doc_model.dart';
import 'package:engage_library/utils/engagefire.dart';

class EngagefireCollection<T> {
  late String path;
  List list = [];
  EngagefireCollection({
    required this.path,
  });

  get ref {
    FirebaseFirestore.instance.collection(path).withConverter<T>(
          fromFirestore: (snapshot, _) =>
              (T as EngagefireDocModel).fromJson(snapshot.data()!),
          toFirestore: (doc, _) => (doc as EngagefireDocModel).toJson(),
        );
  }

  refresh() {}
}
