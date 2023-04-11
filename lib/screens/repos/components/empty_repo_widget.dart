import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyRepoWidget extends StatelessWidget {
  const EmptyRepoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No repo found',
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Colors.cyan,
        ),
      ),
    );
  }
}
