import 'package:class_app/controllers/authConroller.dart';
import 'package:class_app/firebaseRef/references.dart';
import 'package:class_app/models/questionPaperModel.dart';
import 'package:class_app/services/firebaseStoreageService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController {
  final allPapers = <QuestionPaperModel>[].obs;
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);
      for (var paper in paperList) {
        final imgUrl = await FirebaseStoreageService.getImage(paper.title);
        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void navigateToQuestions(
      {required QuestionPaperModel model, bool tryAgain = false}) {
    AuthController authController = Get.find();
    if (authController.isLoggedIn()) {
      if (tryAgain) {
        Get.back();
      } else {}
    } else {
      authController.showLoginDialog();
    }
  }
}
