import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testnew/controller/splash/splash_controller.dart';
import 'package:testnew/core/paints/icon_logo_painter.dart';
import 'package:testnew/core/theme/app_colors.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        body: const Center(
          child: const CustomPaint(
            painter: const IconLogoPainter(
              color: AppColors.black,
            ),
            size: const Size(120, 120),
          ),
        ),
      ),
    );
  }
}
