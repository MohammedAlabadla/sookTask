import 'dart:io';
import 'package:flutter/widgets.dart';

class Reachability {
  static Future<bool> isInternetConected() async {
    var _icConnected = false;
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _icConnected = true;
      }
    } on SocketException catch (_) {
      _icConnected = false;
    }
    debugPrint('connectivity || $_icConnected');
    return _icConnected;
  }
}
