import 'package:class_app/configs/themes/colors.dart';
import 'package:class_app/widgets/appCircleButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'This is a study app You can use ut as You want. if you understand how this works you wold be able to scale it',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: onSurfaceTextColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              CircleButton(
                  onTap: () {
                    Get.offAllNamed('/home');
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 35,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
