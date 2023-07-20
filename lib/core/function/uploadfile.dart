import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

imageuploadCamera() async {
  final XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 90);
  if (file != null) {
    return File(file.path!);
  } else {
    return null;
  }
}

imageuploadGallery() async {
  final XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.gallery, imageQuality: 90);
  if (file != null) {
    return File(file.path!);
  } else {
    return null;
  }
}
