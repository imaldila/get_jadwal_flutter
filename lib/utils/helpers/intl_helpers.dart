import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

void dismissKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

String convertFromDate(DateTime date, String dateFormat) {
  return DateFormat(dateFormat).format(date);
}

DateTime convertFromString(String value, String dateFormat) {
  DateFormat format = DateFormat(dateFormat);
  return format.parse(value);
}

convertStringToDate(dynamic value, String dateFormat) {
  var converted = convertFromString(value, 'd/M/y');
  return convertFromDate(converted, dateFormat);
}

String formatted(value, {String separator = ',', String trailing = ''}) {
  if (value == null) {
    return '-';
  }
  return value.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}$separator') +
      trailing;
}

String percent(value, {String trailing = ''}) {
  if (value == null) {
    return '-';
  }
  if (value > 0) {
    return '+${value.toStringAsFixed(2)} %$trailing';
  } else {
    return '${value.toStringAsFixed(2)} %$trailing';
  }
}
