import 'package:testnew/translations/ru.dart';
import 'package:testnew/translations/uz.dart';

import 'en.dart';

abstract class AppTranslations {
  static Map<String, Map<String, String>> translations = {
    'en': en,
    'ru': ru,
    'uz': uz,
  };
}
