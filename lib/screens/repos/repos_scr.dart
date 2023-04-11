import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sookps/controllers/repos_controller.dart';
import 'package:sookps/screens/repos/components/repo_item_widget.dart';
import 'package:sookps/screens/widgets/loading_widget.dart';
import '../search/search_scr.dart';
import 'components/empty_repo_widget.dart';

class ReposScreen extends StatelessWidget {
  ReposScreen({super.key});
  //
  final reposController = Get.find<ReposController>();
  //
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      reposController.page = 1;
      reposController.repos.clear();
      reposController.fetchGoogleRepo();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Repos'),
        backgroundColor: Colors.cyan.shade600,
        leading: IconButton(
          onPressed: () {
            reposController.page = 1;
            reposController.repos.clear();
            reposController.fetchGoogleRepo();
          },
          icon: Icon(Icons.refresh),
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          statusRequest: reposController.viewStatus.value,
          child: Container(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                searchBtnWidget(),
                SizedBox(height: 20.h),
                reposFetchCountWidget(),
                Divider(color: Colors.black),
                //
                reposController.repos.isEmpty
                    ? EmptyRepoWidget()
                    : buildRepoListWidget(),
                //
              ],
            ),
          ),
        ),
      ),
    );
  }

  //
  //
  NotificationListener<ScrollNotification> buildRepoListWidget() {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels ==
            notification.metrics.maxScrollExtent) {
          reposController.page += 1;
          reposController.fetchGoogleRepo();
        }
        return false;
      },
      child: Expanded(
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 10.h,
            child: Divider(color: Colors.black38),
          ),
          itemCount: reposController.repos.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => RepoItemWidget(
            repo: reposController.repos[index],
          ),
        ),
      ),
    );
  }

  //
  Row reposFetchCountWidget() {
    return Row(
      children: [
        Text(
          '${reposController.repos.length} repository results of Google',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  //
  Widget searchBtnWidget() {
    return InkWell(
      onTap: () => Get.to(() => SearchScreen()),
      child: Container(
        height: 50.h,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.black54),
            SizedBox(width: 10.w),
            Text('search ...'),
          ],
        ),
      ),
    );
  }
  //
}
