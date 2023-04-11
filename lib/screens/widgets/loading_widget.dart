import 'package:flutter/material.dart';
import '../../Networking/progress.dart';
import '../../Networking/status_request.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget(
      {Key? key, required this.statusRequest, required this.child})
      : super(key: key);
  //
  final Widget child;
  final ViewStatus statusRequest;
  //
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //
        child,
        //
        statusRequest == ViewStatus.loading ? ShowProgress.show() : Container(),
        //
      ],
    );
  }
}
