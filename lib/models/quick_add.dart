// // import 'package:file_picker_cross/file_picker_cross.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
// import 'package:smart_select/smart_select.dart';

// class QuickAdd<T> {
//   EdgeInsets margin;
//   String hintText;
//   String labelText;
//   String helperText;
//   String type;
//   dynamic initialValue;
//   String error;
//   TextInputType inputType;
//   TextInputAction inputAction;
//   FileType fileType;
//   bool autofocus;
//   bool correct;
//   int maxLines;
//   DateFormat dateFormat;
//   FocusNode node;
//   Widget smartLeading;
//   MaskTextInputFormatter mask;
//   bool readOnly;
//   T collection;
//   List<Map<String, String>> items;
//   List<SmartSelectOption<String>> smartOptions;
//   String addRoute;
//   ValueChanged<dynamic> onChanged;
//   ValueChanged<dynamic> onSubmitted;

//   QuickAdd({
//     this.margin = const EdgeInsets.only(bottom: 10),
//     this.hintText = '',
//     this.labelText = '',
//     this.helperText = '',
//     this.type = 'text',
//     this.initialValue,
//     this.error,
//     this.inputType = TextInputType.text,
//     this.inputAction = TextInputAction.done,
//     this.fileType = FileType.any,
//     this.autofocus = false,
//     this.correct = false,
//     this.readOnly = false,
//     this.maxLines,
//     this.dateFormat,
//     this.node,
//     this.smartLeading,
//     this.mask,
//     this.collection,
//     this.items,
//     this.smartOptions,
//     this.addRoute = '/quickAdd',
//     this.onChanged,
//     this.onSubmitted,
//   });
// }