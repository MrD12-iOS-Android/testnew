import 'package:get/get.dart';
import 'package:testnew/bindings/main_bindings.dart';
import 'package:testnew/routes/app_routes.dart';
import 'package:testnew/ui/main/main/main_page.dart';
import 'package:testnew/ui/splash/splash_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => SplashPage()),
    GetPage(name: Routes.MAIN, page: () => MainPage(), binding: MainBindings()),
  ];
}