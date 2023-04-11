import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sookps/models/repo.dart';
import 'package:sookps/screens/widgets/cash_image.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key, this.user});
  final User? user;
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      child: Row(
        children: [
          SizedBox(
            width: 50.w,
            child: Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
                color: Colors.grey.shade200,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: CashImageW(
                  imageUrl: user?.avatarUrl ?? "",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user?.login ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),

                //
              ],
            ),
          ),
        ],
      ),
    );
  }

  //

  //
}
