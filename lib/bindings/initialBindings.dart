import 'package:class_app/controllers/authConroller.dart';
import 'package:class_app/controllers/themeController.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
  }
}
