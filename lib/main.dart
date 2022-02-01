import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:testnew/data/data_source/local_source.dart';
import 'package:testnew/data/floor/app_database.dart';
import 'package:testnew/data/provider/api_client.dart';
import 'package:testnew/routes/app_pages.dart';
import 'package:testnew/routes/app_routes.dart';
import 'package:testnew/translations/app_translations.dart';
import 'bindings/main_bindings.dart';
import 'core/theme/app_theme.dart';

void main() async {
  await GetStorage.init();
  await AppDatabase.init();
  final currentLocale = LocalSource.getInstance().getLocale();
  runApp(MyApp(currentLocale: currentLocale));
}

class MyApp extends StatelessWidget {
  final String currentLocale;

  const MyApp({Key? key, required this.currentLocale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: [GestureType.onTap],
      child: GetMaterialApp(
        navigatorKey: ApiClient.alice.getNavigatorKey(),
        theme: appThemeData,
        debugShowCheckedModeBanner: false,
        initialBinding: MainBindings(),
        initialRoute: Routes.INITIAL,
        getPages: AppPages.pages,
        locale: Locale(currentLocale),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        translationsKeys: AppTranslations.translations,
        defaultTransition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 100),
      ),
    );
  }
}
