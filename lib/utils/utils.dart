
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import "package:intl/intl.dart";

class Utils {
  static NumberFormat _numberFormatter;
  static DateFormat _dateFormatter;

  static NumberFormat get numberFormatter {
    if (_numberFormatter != null) {
      return _numberFormatter;
    }
    _numberFormatter = NumberFormat();
    return _numberFormatter;
  }

  static DateFormat get dateFormatter {
    if (_dateFormatter != null) {
      return _dateFormatter;
    }
    _dateFormatter = DateFormat('d MMM, HH:mm');

    return _dateFormatter;
  }

  static showToast(BuildContext context, String msg, {int duration = 5, Color color = const Color(0xFFe74c3c)}) {
    Toast.show(msg, context, duration: duration, gravity: Toast.BOTTOM, backgroundColor: color);
  }

  static int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  static orderMap({@required Map map, List<String> eliminateFields}) {
    eliminateFields.forEach((element) {
      map.removeWhere((key, value) => key == element);
    });

    final sorted = new SplayTreeMap.from(map, (a, b) => a.compareTo(b));
    return sorted;
  }

  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(4, 10), radix: 16) + 0xFF000000);
  }

  
}
