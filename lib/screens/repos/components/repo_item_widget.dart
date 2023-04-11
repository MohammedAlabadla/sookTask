import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sookps/models/repo.dart';
import 'package:sookps/screens/widgets/cash_image.dart';

class RepoItemWidget extends StatelessWidget {
  const RepoItemWidget({super.key, this.repo});
  final Repo? repo;
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      child: Row(
        children: [
          ownerDataWidget(),
          SizedBox(width: 20.w),
          repoDataWidget(),
        ],
      ),
    );
  }

  //
  Widget repoDataWidget() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  repo?.name ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    '${((repo?.watchersCount ?? 1) / 1000).toStringAsFixed(1)} k',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    Icons.visibility,
                    color: Colors.yellow.shade800,
                    size: 18.sp,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            repo?.description ?? '-',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          //
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // star-count
              Row(
                children: [
                  Text(
                    '${((repo?.stargazersCount ?? 1) / 1000).toStringAsFixed(1)} k',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    Icons.star_border,
                    color: Colors.yellow.shade800,
                    size: 18.sp,
                  ),
                ],
              ),
              // const SizedBox(width: 20),
              // language
              Row(
                children: [
                  Text(
                    repo?.language ?? "",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Icon(
                    Icons.donut_large_outlined,
                    color: Colors.black,
                    size: 18.sp,
                  ),
                ],
              ),
              // have-issues
              // const SizedBox(width: 20),
              Row(
                children: [
                  Text(
                    '${repo?.openIssuesCount} issues',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Icon(Icons.question_mark, color: Colors.black, size: 18.sp),
                ],
              ),
              //

              //
            ],
          )
          //
        ],
      ),
    );
  }

  Widget ownerDataWidget() {
    return SizedBox(
      width: 50.w,
      child: Column(
        children: [
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: Colors.grey.shade200,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.r),
              child: CashImageW(
                imageUrl: repo?.owner?.avatarUrl ?? "",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            repo?.owner?.login ?? "",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  //
}
