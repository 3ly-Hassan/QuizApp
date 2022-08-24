import 'package:class_app/configs/themes/colors.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool enabled;
  final Widget? child;
  final Color? color;
  const MainButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.enabled = true,
      this.child,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        height: 55,
        child: InkWell(
          onTap: enabled ? onTap : null,
          child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: color ?? Theme.of(context).cardColor),
              padding: const EdgeInsets.all(10.0),
              child: child ??
                  Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: onSurfaceTextColor),
                    ),
                  )),
        ),
      ),
    );
  }
}
