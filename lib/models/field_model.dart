import 'package:engage_library/models/engagefire_doc_model.dart';

enum FieldType {
  text,
  number,
  multipicker,
  picker,
  file,
  image,
  collection,
}

class FieldModel extends EngagefireDocModel {
  String? name;
  String? value;
  bool required = false;
  String? collection;
  FieldType type = FieldType.text;

  FieldModel({
    this.name,
    this.value,
    this.required = false,
    this.collection,
    this.type = FieldType.text,
  });

  FieldModel.fromJson(Map data) {
    fromJson(data);
  }

  fromJson(Map data) {
    name = data['name'];
    value = data['value'];
    collection = data['collection'];
    collection = data['required'] ?? false;
    type = FieldType.values[data['type'] ?? 0];
  }

  toJson() {
    return {
      name: name,
      value: value,
      required: required,
      type: type.index,
    };
  }
}
