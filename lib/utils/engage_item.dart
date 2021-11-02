import 'package:engage_library/utils/engagefire_doc.dart';

class EngageItemModel<T> {
  final String? name;
  final String? routePath;
  final String? docPath;
  final String? icon;
  final String? details;
  final Function? onPressed;
  dynamic value;
  late final EngagefireDoc<T>? doc;
  String? docValue;
  final bool valueAsProgress;
  final num? progressMax;
  EngageItemModel({
    this.name,
    this.routePath,
    this.docPath,
    this.icon,
    this.details,
    this.onPressed,
    this.value,
    this.doc,
    this.docValue,
    this.valueAsProgress = false,
    this.progressMax = 100,
  }) {
    setDoc();
    setValueFromDoc();
  }

  refresh() async {
    doc = await doc?.$refresh();
    setValueFromDoc();
  }

  setValueFromDoc() {
    if (doc != null && docValue != null) {
      value = doc?.$toMap()[docValue];
    }
  }

  setDoc() {
    if (doc == null && docPath != null) {
      doc = EngagefireDoc<T>(path: docPath);
    }
  }
}
