import 'dart:convert';

import 'package:class_app/firebaseRef/loadingStatus.dart';
import 'package:class_app/firebaseRef/references.dart';
import 'package:class_app/models/questionPaperModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.loading.obs; //loadingStatus is obs
  void uploadData() async {
    loadingStatus.value = LoadingStatus.loading; //0
    final fireStore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    //load json file and print path
    final papersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith('assets/DB/papers') && path.contains('.json'))
        .toList();
    List<QuestionPaperModel> questionPapers = [];
    for (var paper in papersInAssets) {
      String stringPaperCotent = await rootBundle.loadString(paper);
      questionPapers
          .add(QuestionPaperModel.fromJson(json.decode(stringPaperCotent)));
    }
    var batch = fireStore.batch();
    for (var paper in questionPapers) {
      batch.set(questionPaperRF.doc(paper.id), {
        'title': paper.title,
        'imageUrl': paper.imageUrl,
        'description': paper.description,
        'timeSeconds': paper.timeSeconds,
        'questionsCount': paper.questions == null ? 0 : paper.questions!.length
      });
      for (var questions in paper.questions!) {
        final questionPath =
            questionRF(paperId: paper.id!, questionId: questions.id!);
        batch.set(questionPath, {
          'question': questions.question,
          'correctAnswerr': questions.correctAnswer,
        });
        for (var answer in questions.answers!) {
          batch.set(questionPath.collection('answer').doc(answer.identifier), {
            'identifier': answer.identifier,
            'answer': answer.answer,
          });
        }
      }
    }

    await batch.commit();
    loadingStatus.value = LoadingStatus.completed; //1
  }
}
