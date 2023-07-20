import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../HandlingDataView.dart';
import '../controller/homeControoler.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ImphomePageControoler controller = Get.put(ImphomePageControoler());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: InkWell(
            onLongPress: () {
              controller.Pickfromcamera();
            },
            child: FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 44, 159, 236),
              child: Icon(Icons.image),
              onPressed: () {
                controller.Pickfromgalley();
              },
            )),
        body: WillPopScope(
            onWillPop: () {
              Get.defaultDialog(
                  title: "Warning".tr,
                  middleText: "Are you sure you want to leave app",
                  onConfirm: () {
                    exit(0);
                  },
                  onCancel: () {},
                  buttonColor: Colors.grey,
                  confirmTextColor: Colors.white,
                  cancelTextColor: Colors.grey,
                  textConfirm: "yes",
                  textCancel: "no");
              return Future.value(false);
            },
            child: GetBuilder<ImphomePageControoler>(
                builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/pxfuel.jpg",
                              ))),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(),
                          controller.file != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.file(controller.file!),
                                )
                              : Container(),
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                          Text(
                            "${controller.resultlabel}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                    )))));
  }
}
