import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

SizedBox get sizedBoxShrink => const SizedBox.shrink();

SizedBox sizedBoxHeight(double height) {
  return SizedBox(
    height: height,
  );
}

SizedBox sizedBoxWidth(double width) {
  return SizedBox(
    width: width,
  );
}

DateFormat get dateFormat => DateFormat("dd-MM-yyyy");
DateFormat get dateFormatWithTime => DateFormat("dd-MM-yyyy hh:mm:ss a");

bool isEmailValidate(String email) {
  var regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (regExp.hasMatch(email)) {
    return true;
  }
  return false;
}
