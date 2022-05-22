import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChangeLocale {
  static void changeLocalization(BuildContext context, String first) {
    if (first == 'en') {
      context.setLocale(Locale(first, 'US'));
    } else {
      context.setLocale(Locale(first, first.toUpperCase()));
    }
  }
}
