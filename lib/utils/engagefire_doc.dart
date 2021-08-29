import 'package:engage_library/models/engagefire_doc_model.dart';
import 'package:engage_library/utils/engagefire.dart';

class EngagefireDoc<T> {
  Engagefire parent;
  T doc;
  EngagefireDoc({
    required this.parent,
    required this.doc,
  });

  addMeta() {
    if (doc is EngagefireDocModel) {
      (doc as EngagefireDocModel).updatedAt =
          DateTime.now().millisecondsSinceEpoch;
      (doc as EngagefireDocModel).createdAt =
          DateTime.now().millisecondsSinceEpoch;
    }
  }

  save({doc}) {
    if (doc?.id) {
      // update
    } else {
      // add
    }
  }
}
