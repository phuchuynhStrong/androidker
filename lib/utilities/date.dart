import 'package:intl/intl.dart';

final publishTimeFormat = DateFormat.yMMMMd();

String formatArticlePublishTime(DateTime? datetime) {
  if (datetime == null) {
    return '';
  }

  return publishTimeFormat.format(datetime);
}
