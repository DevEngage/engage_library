import 'package:engage_library/models/field_model.dart';
import 'package:engage_library/utils/engagefire_collection.dart';
import 'package:engage_library/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class EngageAddScreen extends StatefulWidget {
  final String path;
  final List? fields;
  EngageAddScreen({Key? key, required this.path, this.fields})
      : super(key: key);

  @override
  _EngageAddScreenState createState() => _EngageAddScreenState();
}

class _EngageAddScreenState extends State<EngageAddScreen> {
  @override
  Widget build(BuildContext context) {
    final collection = EngagefireCollection<FieldModel>(path: widget.path);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.black38,
        child: ListView(
          children: [
            Text(widget.path),
            SizedBox(
              height: 16,
            ),
            for (var item in widget.fields ?? collection.list)
              EngageInput(
                // margin: qa.margin,
                // hintText: qa.hintText,
                labelText: item.name,
                // helperText: qa.helperText,
                // type: qa.type,
                initialValue: item.value,
                // error: qa.error,
                type: 'text',
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
                onChanged: (val) => item.value = val,
              ),
            GFButton(
                onPressed: () {
                  print(widget.fields);
                },
                text: "Save"),
          ],
        ),
      ),
    );
  }
}

showFilterModal({String path = ''}) async {
  MediaQueryData queryData = MediaQuery.of(Get.context!);
  return Get.bottomSheet(
    Container(
      height: queryData.size.height / 2,
      child: EngageAddScreen(
        path: path,
      ),
    ),
    isScrollControlled: true,
  );
}
