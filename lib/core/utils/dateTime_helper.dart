import 'package:intl/intl.dart';

String month(DateTime date) {
  String monthName = '...';
  var dateFormat = DateFormat("MMM");
  monthName = dateFormat.format(date);

  return monthName;
}

String period(DateTime date) {
  var dateFormat = DateFormat("aa");
  var period = dateFormat.format(date);
  return period;
}

String hour(DateTime date) {
  var dateFormat = DateFormat("hh");
  var hr = dateFormat.format(date);
  return hr;
}

String minutes(DateTime date) {
  var dateFormat = DateFormat("mm");
  var min = dateFormat.format(date);
  return min;
}
