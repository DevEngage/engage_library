import 'package:engage_library/utils/engagefire_doc.dart';

class EngageItem<T> {
  final String? name;
  final String? routePath;
  final String? docPath;
  final String? icon;
  final String? details;
  final Function? onPressed;
  final dynamic value;
  final EngagefireDoc<T>? doc;
  final dynamic docValue;
  final bool valueAsProgress;
  final num? progressMax;
  EngageItem({
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
  });
}
