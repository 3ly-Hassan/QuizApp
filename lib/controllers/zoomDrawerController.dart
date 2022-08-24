import 'package:class_app/controllers/authConroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();
  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toogleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
    user.value = Get.find<AuthController>().getUser();
  }

  void signIn() {
    Get.find<AuthController>().signInWithGoogle();
    user.value = Get.find<AuthController>().getUser();
  }

  void webSite() {
    _launch(Uri.parse('https://www.linkedin.com/in/alihassan191999/'));
  }

  void facebook() {
    _launch(Uri.parse('https://www.facebook.com/3lyHassanAli/'));
  }

  void email() {
    final Uri emailLauncherUri = Uri(
      scheme: 'mailto',
      path: 'Ah074321@gmail.com',
    );
    _launch(emailLauncherUri);
  }

  void _launch(Uri url) async {
    if (!await launchUrl(url)) {
      if (kDebugMode) {
        print('couldn\'t launch ${url.toString()}');
      }
    }
  }
}
