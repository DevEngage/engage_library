import 'package:engage_library/enum/types.dart';
import 'package:engage_library/models/engagefire_doc_model.dart';
import 'package:engage_library/models/field_list_model.dart';
import 'package:engage_library/widgets/input.dart';

class FieldModel extends EngagefireDocModel {
  String? name;
  String? hintText;
  String? labelText;
  String? helperText;
  String? value;
  String? error;
  bool required = false;
  String? collection;
  List<FieldListModel>? list; // multiselect
  FieldType type = FieldType.text;
  FileType fileType = FileType.any;

  FieldModel({
    this.name,
    this.value,
    this.required = false,
    this.collection,
    this.list,
    this.error,
    this.type = FieldType.text,
    this.fileType = FileType.any,
  });

  FieldModel.fromJson(Map data) {
    fromJson(data);
  }

  fromJson(Map data) {
    name = data['name'];
    value = data['value'];
    collection = data['collection'];
    list = data['list'];
    error = data['error'];
    collection = data['required'] ?? false;
    type = FieldType.values[data['type'] ?? 0];
    fileType = FileType.values[data['fileType'] ?? 0];
  }

  toJson() {
    return {
      name: name,
      value: value,
      required: required,
      list: list,
      error: error,
      type: type.index,
      fileType: fileType.index,
    };
  }

  toInputWidget({
    iLabelText,
    iHelperText,
    iMargin,
    iHintText,
    iValue,
    iError,
  }) {
    return EngageInput(
      margin: iMargin,
      hintText: iHintText ?? hintText,
      labelText: iLabelText ?? labelText ?? name,
      helperText: iHelperText ?? helperText,
      type: type,
      initialValue: value,
      error: iError ?? error,
      items: list,
      // inputAction: qa.inputAction,
      // // fileType: qa.fileType,
      // autofocus: qa.autofocus,
      // correct: qa.correct,
      // readOnly: qa.readOnly,
      // maxLines: qa.maxLines,
      // dateFormat: qa.dateFormat,
      // node: qa.node,
      // smartLeading: qa.smartLeading,
      // mask: qa.mask,
      // collection: qa.collection,
      // items: qa.items,
      // // smartOptions: qa.smartOptions,
      // onChanged: qa.onChanged,
      // onSubmitted: (val) => item.value = val,
      onChanged: (val) => value = val,
    );
  }
}
