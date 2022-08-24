import 'package:cached_network_image/cached_network_image.dart';
import 'package:class_app/configs/themes/customTextsStyle.dart';
import 'package:class_app/configs/themes/icons.dart';
import 'package:class_app/configs/themes/uiParameters.dart';
import 'package:class_app/models/questionPaperModel.dart';
import 'package:class_app/widgets/appIconText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/questionPaper/questionPaperController.dart';

class QuestionCard extends GetView<QuestionPaperController> {
  final QuestionPaperModel model;

  const QuestionCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double padding = 10.0;
    return Container(
      decoration: BoxDecoration(
          borderRadius: UIParameters.cardBorderRadius,
          color: Theme.of(context).cardColor),
      child: InkWell(
        onTap: () {
          controller.navigateToQuestions(model: model);
        },
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ColoredBox(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      child: SizedBox(
                        height: Get.width * 0.15,
                        width: Get.width * 0.15,
                        child: CachedNetworkImage(
                          imageUrl: model.imageUrl!,
                          placeholder: ((context, url) {
                            return Container(
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            );
                          }),
                          errorWidget: (context, url, error) =>
                              Image.asset('assets/images/app_splash_logo.png'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(model.title!, style: cardTitlesStyle(context)),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: Text(model.description!),
                        ),
                        Row(
                          children: [
                            AppIconText(
                                icon: Icon(
                                  Icons.help_outline_sharp,
                                  color: UIParameters.isDarkMood()
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                                ),
                                text: Text('${model.questionCount} questions',
                                    style: cardDetailsStyle(context))),
                            const SizedBox(width: 15),
                            AppIconText(
                                icon: Icon(
                                  Icons.timer,
                                  color: UIParameters.isDarkMood()
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                                ),
                                text: Text(
                                  model.timeInMin(),
                                  style: cardDetailsStyle(context),
                                ))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                  bottom: -padding,
                  right: -padding,
                  child: GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: const Icon(
                        AppIcons.trophyOutLine,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
