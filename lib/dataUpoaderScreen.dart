import 'package:class_app/controllers/questionPaper/dataUploader.dart';
import 'package:class_app/firebaseRef/loadingStatus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({Key? key}) : super(key: key);
  final DataUploader controller = Get.put(DataUploader());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Text(
            controller.loadingStatus.value == LoadingStatus.completed
                ? 'uploading completed'
                : 'uploading')),
      ),
    );
  }
}
