import 'package:class_app/controllers/questionPaper/questionPaperController.dart';
import 'package:class_app/controllers/zoomDrawerController.dart';
import 'package:class_app/screens/home/homeScreen.dart';
import 'package:class_app/screens/introduction/introduction.dart';
import 'package:class_app/screens/login/loginScreen.dart';
import 'package:get/get.dart';

import '../screens/splash/splashScreen.dart';

class Routes {
  static List<GetPage> routes() => [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(
            name: '/introduction', page: () => const AppIntroductionScreen()),
        GetPage(
            name: '/home',
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
      ];
}
