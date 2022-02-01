// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';
import 'package:testnew/data/data_source/local_source.dart';
import 'package:testnew/data/models/token/refresh_token_request.dart';
import 'package:testnew/data/models/token/refresh_token_response.dart';

class BaseFunctions {
  static String numberWithZero(String number) {
    if (number.substring(0, 1) == '0')
      return number;
    else if (number.length == 1) return "0$number";
    return number;
  }

  static String moneyFormat(num number) {
    String splitter = " ";
    final isNegative = number.isNegative;
    number = number.abs();
    String result = "0";
    result = NumberFormat().format(number).split(",").join(splitter);
    return isNegative ? "-" + result : result;
  }

  static Future<void> refreshToken() async {
    var request = RefreshTokenRequest(
      refreshToken: LocalSource.getInstance().getRefreshToken(),
    );
  }

// static String getStringByLanguage(Title value) {
//   var lang = GetStorage().read<String>('locale') ?? 'ru';
//   if (lang == 'ru') {
//     return value?.ru ?? '';
//   } else if (lang == 'en') {
//     return value?.en ?? '';
//   } else {
//     return value?.uz ?? '';
//   }
// }
}
