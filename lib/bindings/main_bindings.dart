import 'package:get/get.dart';
import 'package:testnew/controller/main/detail_controller.dart';
import 'package:testnew/controller/main/home/home_controller.dart';
import 'package:testnew/controller/main/main_controller.dart';
import 'package:testnew/controller/splash/splash_controller.dart';
import 'package:testnew/data/provider/api_client.dart';
import 'package:testnew/data/repository/home/home_repository.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => MainController(), fenix: true);
    // Get.lazyPut(() => DetailController());
    Get.lazyPut<HomeController>(
      () => HomeController(
        repository: HomeRepository(apiClient: ApiClient.getInstance()),
      ),
      fenix: true,
    );
    Get.lazyPut<DetailController>(
          () => DetailController(
        repository: HomeRepository(apiClient: ApiClient.getInstance()),
      ),
    );
  }
}
