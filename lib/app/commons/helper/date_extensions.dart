import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension DateHelper on DateTime {
  String format() {
    initializeDateFormatting();
    final outputFormat = DateFormat('dd MMMM yyyy', 'id');
    return outputFormat.format(this);
  }
}
