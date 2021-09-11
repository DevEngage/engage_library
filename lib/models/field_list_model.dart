import 'package:engage_library/enum/types.dart';
import 'package:engage_library/models/engagefire_doc_model.dart';

class FieldListModel extends EngagefireDocModel {
  String? name;
  dynamic value;

  static List<FieldListModel> inputFieldList = [
    FieldListModel(name: 'Text', value: FieldType.text),
    FieldListModel(name: 'Checkbox', value: FieldType.checkbox),
  ];

  FieldListModel({
    this.name,
    this.value,
  });

  FieldListModel.fromJson(Map data) {
    fromJson(data);
  }

  fromJson(Map data) {
    name = data['name'];
    value = data['value'];
  }

  toJson() {
    return {
      name: name,
      value: value,
    };
  }
}
