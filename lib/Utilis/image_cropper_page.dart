import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ocr/Screen/recognization_page.dart';
import 'package:image_cropper/image_cropper.dart';

Future<String> imageCropperView(String? path, BuildContext context)async {
  CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath: path!,
    aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ],
    uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      IOSUiSettings(
        title: 'Crop Image',
      ),
      WebUiSettings(
        context: context,
      ),
    ],
  );
  if (croppedFile != null){
    log("Image Cropped");
      return croppedFile.path;
  } else {
    log("Do Nothing");
    return '';
  }
}