import 'package:intl/intl.dart';

class EnumUtils {
  static String? getCommonEnumName(String? enumAsString) {
    if (enumAsString == null || enumAsString.isEmpty) {
      return '';
    }

    return enumAsString.split(".").last;
  }

  static String? getCapitalizedEnumName(String? enumAsString) {
    return toBeginningOfSentenceCase(getCommonEnumName(enumAsString));
  }
}
