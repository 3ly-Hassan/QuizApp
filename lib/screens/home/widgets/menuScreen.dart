import 'package:class_app/configs/themes/colors.dart';
import 'package:class_app/configs/themes/uiParameters.dart';
import 'package:class_app/controllers/zoomDrawerController.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMenuScreen extends GetView<MyZoomDrawerController> {
  const MyMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.infinity,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
        data: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(primary: onSurfaceTextColor))),
        child: SafeArea(
            child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: BackButton(
                color: Colors.white,
                onPressed: () {
                  controller.toogleDrawer();
                  if (kDebugMode) {
                    print('back from zoom is tapped');
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Column(
                children: [
                  Obx(() => controller.user.value == null
                      ? const SizedBox()
                      : Text(
                          controller.user.value!.displayName ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: onSurfaceTextColor),
                        )),
                  const Spacer(
                    flex: 1,
                  ),
                  _DrawerButton(
                      icon: Icons.web,
                      label: 'lenkedIn',
                      onPressed: () => controller.webSite()),
                  _DrawerButton(
                      icon: Icons.facebook,
                      label: 'facebook',
                      onPressed: () => controller.facebook()),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: _DrawerButton(
                        icon: Icons.email,
                        label: 'email',
                        onPressed: () => controller.email()),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  _DrawerButton(
                      icon: Icons.logout,
                      label: controller.user.value == null ? 'login' : 'logout',
                      onPressed: () => controller.signOut()),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton(
      {Key? key,
      required this.icon,
      required this.label,
      required this.onPressed})
      : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 15,
        ),
        label: Text(label));
  }
}
