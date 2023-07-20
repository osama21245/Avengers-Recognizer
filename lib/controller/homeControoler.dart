import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import '../core/class/statusrequest.dart';
import '../core/function/uploadfile.dart';

abstract class homePageControoler extends GetxController {
  StatusRequest? statusRequest;
  String resultlabel = "";
  File? file;
  late ImagePicker imagepicker;
}

class ImphomePageControoler extends homePageControoler {
  Pickfromgalley() async {
    statusRequest = StatusRequest.loading;
    await loadmodel();

    update();
    file = await imageuploadGallery();
    CheckImage();
    statusRequest = StatusRequest.success;

    update();
  }

  Pickfromcamera() async {
    statusRequest = StatusRequest.loading;
    update();
    file = await imageuploadCamera();
    CheckImage();
    statusRequest = StatusRequest.success;
    update();
  }

  loadmodel() async {
    statusRequest = StatusRequest.loading;
    update();

    String? output = await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
    print(output);
    statusRequest = StatusRequest.success;
    update();
  }

  CheckImage() async {
    var recognition = await Tflite.runModelOnImage(
        path: file!.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 1,
        threshold: 0.1,
        asynch: true);
    print(recognition!.length.toString());

    resultlabel = "";
    update();
    recognition.forEach((element) {
      print(element.toString());
      resultlabel = element['label'] + '\n\n';
      update();
    });
  }

  @override
  void onInit() {
    loadmodel();
    imagepicker = ImagePicker();
  }
}
