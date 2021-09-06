import 'package:engage_library/models/engagefire_doc_model.dart';
import 'package:engage_library/utils/engagefire.dart';

class EngagefireDoc<T> {
  Engagefire parent;
  late T doc;
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

  save() async {
    if ((doc as EngagefireDocModel).$id != null) {
      // update
      await parent.ref.update(doc);
    } else {
      // add
      await parent.ref.set(doc);
    }
  }

   toggle(String field) async {
    // await parent?.doc(task.id).update({
    //   ...task.toJson(),
    //   'isDone': !task.isDone,
    // });
    await save();
  }

  count(field) {
    
  }

  refresh() {
    if ((doc as EngagefireDocModel).$id != null) {
      parent.getDoc((doc as EngagefireDocModel).$id);
    }
  }
}
