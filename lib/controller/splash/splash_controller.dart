import 'package:testnew/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:testnew/routes/app_routes.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    Future.delayed(Duration(milliseconds: 1500), () {
      Get.toNamed(Routes.MAIN);
    });
    super.onInit();
  }
}
