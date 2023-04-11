import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sookps/controllers/search_controller.dart';
import 'package:sookps/screens/repos/components/repo_item_widget.dart';
import 'package:sookps/screens/search/components/search_bar_widget.dart';
import 'package:sookps/screens/widgets/loading_widget.dart';
import 'components/user_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  //
  final searchController = Get.find<SearchController>();
  //
  setup() {
    searchController.page = 1;
    searchController.repos.clear();
    searchController.users.clear();
    searchController.selectedRepoSortField =
        searchController.sortRepoFields['best match']!;
    searchController.selectedUserSortField =
        searchController.sortUserFields['best match']!;
  }

  //
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setup();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Colors.cyan.shade600,
      ),
      body: Obx(
        () => LoadingWidget(
          statusRequest: searchController.viewStatus.value,
          child: Container(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                SearchBarWidget(),
                //
                searchController.isSearchForRepo.value
                    ? repoItemsListWidget()
                    : usersItemsListWidget(),
                //
                //
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded usersItemsListWidget() {
    return Expanded(
      child: ListView.separated(
        itemCount: searchController.users.length,
        shrinkWrap: true,
        separatorBuilder: (context, index) => SizedBox(
          height: 10.h,
          child: Divider(color: Colors.black38),
        ),
        itemBuilder: (context, index) => UserWidget(
          user: searchController.users[index],
        ),
      ),
    );
  }

  Expanded repoItemsListWidget() {
    return Expanded(
      child: ListView.separated(
        itemCount: searchController.repos.length,
        shrinkWrap: true,
        separatorBuilder: (context, index) => SizedBox(
          height: 10.h,
          child: Divider(color: Colors.black38),
        ),
        itemBuilder: (context, index) => RepoItemWidget(
          repo: searchController.repos[index],
        ),
      ),
    );
  }
}
