import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

class Utils {
  getyMdDate([millisecondsDate]) {
    millisecondsDate ??= DateTime.now().millisecondsSinceEpoch;
    var date = new DateTime.fromMillisecondsSinceEpoch(millisecondsDate);
    return "${date.day}-${date.month}-${date.year}";
  }

  convertNumberToDouble(number) {
    return number is String ? double.parse(number) : number;
  }

  // Future<String> imagePickerBase64(
  //     {cropImage = true, source: ImageSource.gallery}) async {
  //   File image = await imagePicker(cropImage: cropImage, source: source);
  //   if (image == null) {
  //     return null;
  //   }
  //   return base64Encode(await image.readAsBytes());
  // }

  // Future<File> imagePicker(
  //     {cropImage = true, source: ImageSource.gallery}) async {
  //   File image = await ImagePicker.pickImage(source: source);
  //   if (cropImage) {
  //     image = await imageCropper(image);
  //   }
  //   if (image == null) {
  //     Get.snackbar('Canceled', 'No image selected');
  //     return null;
  //   }
  //   return image;
  // }

  // Future<File> imageCropper(imageFile) async {
  //   File croppedFile = await ImageCropper.cropImage(
  //       aspectRatio: CropAspectRatio(ratioX: 4.0, ratioY: 4.0),
  //       sourcePath: imageFile.path,
  //       aspectRatioPresets: [
  //         CropAspectRatioPreset.square,
  //         // CropAspectRatioPreset.ratio3x2,
  //         // CropAspectRatioPreset.original,
  //         // CropAspectRatioPreset.ratio4x3,
  //         // CropAspectRatioPreset.ratio16x9
  //       ],
  //       androidUiSettings: AndroidUiSettings(
  //           toolbarTitle: 'Cropper',
  //           toolbarColor: AppTheme.figmaPurple,
  //           toolbarWidgetColor: AppTheme.figmaLightGreen,
  //           initAspectRatio: CropAspectRatioPreset.original,
  //           lockAspectRatio: false),
  //       iosUiSettings: IOSUiSettings(
  //         minimumAspectRatio: 1.0,
  //       ));
  //   return croppedFile;
  // }

  String base64Encode(List<int> bytes) => base64.encode(bytes);

  String mealTimeOfDay() {
    DateTime now = DateTime.now();
    if (now.hour <= 9) {
      return 'breakfast';
    } else if (now.hour > 10 && now.hour < 15) {
      return 'lunch';
    } else if (now.hour > 15) {
      return 'dinner';
    }
    return 'snack';
  }
}
