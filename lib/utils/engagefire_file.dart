import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseStorage storage = FirebaseStorage.instance;

/* 
TODO:
[] upload
[] relate to field
 */
class EngagefireFile {
  String? ref;
  EngagefireFile.fromField(Map doc) {}

  generatePath() {}

  upload() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      Uint8List? fileBytes = result.files.first.bytes;
      String fileName = result.files.first.name;

      // Upload file
      await FirebaseStorage.instance
          .ref('uploads/$fileName')
          .putData(fileBytes!);
    }
  }

  relateToField() {}

  download() async {
    String downloadURL = await FirebaseStorage.instance
        .ref('users/123/avatar.jpg')
        .getDownloadURL();
    return downloadURL;
  }

  showImage() {}
}
