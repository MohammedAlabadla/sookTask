import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast {
  static void show({required String msg, bool isSuccess = false}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: !isSuccess ? 2 : 1,
      backgroundColor: isSuccess ? Colors.cyan.shade600 : Colors.red,
      textColor: Colors.white,
      fontSize: 17,
    );
  }
}
