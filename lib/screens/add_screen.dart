import 'package:engage_library/utils/engagefire_collection.dart';
import 'package:engage_library/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EngageAddScreen extends StatefulWidget {
  final String path;
  EngageAddScreen({Key? key, required this.path}) : super(key: key);

  @override
  _EngageAddScreenState createState() => _EngageAddScreenState();
}

class _EngageAddScreenState extends State<EngageAddScreen> {
  @override
  Widget build(BuildContext context) {
    final collection = EngagefireCollection(path: widget.path);
    return Container(
       child: ListView(children: [
         for (var item in collection.list)
          EngageInput(
            // margin: qa.margin,
            // hintText: qa.hintText,
            // labelText: qa.labelText,
            // helperText: qa.helperText,
            // type: qa.type,
            // initialValue: qa.initialValue,
            // error: qa.error,
            // inputType: qa.inputType,
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
            // onSubmitted: qa.onSubmitted,
          )
       ],),
    );
  }
}


showFilterModal({String path = ''}) async {
  MediaQueryData queryData = MediaQuery.of(Get.context!);
  return Get.bottomSheet(
    Container(
      height: queryData.size.height / 2,
      child: EngageAddScreen(path: path,),
    ),
    isScrollControlled: true,
  );
}
