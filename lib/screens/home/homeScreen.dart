import 'package:class_app/configs/themes/colors.dart';
import 'package:class_app/configs/themes/customTextsStyle.dart';
import 'package:class_app/configs/themes/icons.dart';
import 'package:class_app/configs/themes/uiParameters.dart';
import 'package:class_app/controllers/questionPaper/questionPaperController.dart';
import 'package:class_app/controllers/zoomDrawerController.dart';
import 'package:class_app/screens/home/widgets/menuScreen.dart';
import 'package:class_app/screens/home/widgets/questionCard.dart';
import 'package:class_app/widgets/contentArea.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();
    return Scaffold(body: GetBuilder<MyZoomDrawerController>(builder: (_) {
      return ZoomDrawer(
        menuScreenWidth: double.infinity,
        borderRadius: 50,
        showShadow: true,
        angle: 0.0,
        slideWidth: MediaQuery.of(context).size.width * .6,
        style: DrawerStyle.defaultStyle,
        controller: _.zoomDrawerController,
        menuScreen: const MyMenuScreen(),
        moveMenuScreen: false,
        mainScreen: Container(
          decoration: const BoxDecoration(gradient: mainGradientLight),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(mobileScreenPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.toogleDrawer();
                        },
                        child: const Icon(
                          AppIcons.menuLeft,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Icon(
                            AppIcons.peace,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Hello from ALi!',
                            style: cardDetailsStyle(context)
                                .copyWith(color: onSurfaceTextColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'What do you want to learn today?',
                        style: headerText(context),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ContentArea(
                      addPadding: false,
                      child: Obx(() => ListView.separated(
                          padding: UIParameters.mobileScreenPadding,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return QuestionCard(
                                model:
                                    questionPaperController.allPapers[index]);
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 20,
                              ),
                          itemCount: questionPaperController.allPapers.length)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
