import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  static void toastMsg(String message, Color backgroundColor, Color textColor) {
    // تنفيذ التوست هنا، على سبيل المثال:
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: backgroundColor,
      textColor: textColor,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}