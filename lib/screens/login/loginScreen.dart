import 'package:class_app/configs/themes/colors.dart';
import 'package:class_app/controllers/authConroller.dart';
import 'package:class_app/widgets/common/mainButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/app_splash_logo.png',
            width: 200,
            height: 200,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 60),
            child: Text(
              'This is a study app. You can use as you want, You have the full access to the materials in this course. please login to continue',
              style: TextStyle(
                color: onSurfaceTextColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          MainButton(
            title: '',
            onTap: () {
              controller.signInWithGoogle();
            },
            child: Stack(children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                child: SvgPicture.asset('assets/icons/google.svg'),
              ),
              Center(
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
