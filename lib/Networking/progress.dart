import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ShowProgress {
  static Widget show() {
    return Container(
      width: MediaQuery.of(Get.context!).size.width,
      height: MediaQuery.of(Get.context!).size.height,
      color: Colors.black12.withOpacity(0.016),
      alignment: Alignment.center,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.cyan,
        ),
        child: SpinKitCircle(size: 50, color: Colors.white),
      ),
    );
  }
}
