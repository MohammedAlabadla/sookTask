import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/search_controller.dart';

class FilterSheet extends StatelessWidget {
  FilterSheet({super.key});

  final searchController = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.filter_list),
      onPressed: () => showModalBottomSheet(
        isScrollControlled: false,
        context: context,
        backgroundColor: Colors.white,
        enableDrag: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(25),
            topStart: Radius.circular(25),
          ),
        ),
        builder: (context) => Container(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              SizedBox(height: 15.h),
              Text(
                'Sort Option',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              const Divider(color: Colors.black54),
              Expanded(
                child: ListView.separated(
                    itemCount: searchController.isSearchForRepo.value
                        ? searchController.sortRepoFields.length
                        : searchController.sortUserFields.length,
                    separatorBuilder: (context, index) =>
                        const Divider(color: Colors.black54),
                    itemBuilder: (context, index) {
                      return searchController.isSearchForRepo.value
                          ? sortRepoWidget(index)
                          : sortUserWidget(index);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox sortRepoWidget(int index) {
    return SizedBox(
      height: 40,
      child: ListTile(
        onTap: () {
          Get.back();
          searchController.selectedRepoSortField =
              searchController.sortRepoFields.values.toList()[index];
          searchController.searchForRepos();
        },
        // contentPadding: EdgeInsets.zero,
        minLeadingWidth: 20,
        leading: SizedBox(
          width: 10.w,
          child: searchController.selectedRepoSortField ==
                  (searchController.sortRepoFields.values.toList()[index])
              ? Icon(Icons.done, color: Colors.red)
              : null,
        ),
        title: Text(searchController.sortRepoFields.keys.toList()[index]),
      ),
    );
  }

  SizedBox sortUserWidget(int index) {
    return SizedBox(
      height: 40,
      child: ListTile(
        onTap: () {
          Get.back();
          searchController.selectedUserSortField =
              searchController.sortUserFields.values.toList()[index];
          searchController.searchForUsers();
        },
        // contentPadding: EdgeInsets.zero,
        minLeadingWidth: 20,
        leading: SizedBox(
          width: 10.w,
          child: searchController.selectedUserSortField ==
                  (searchController.sortUserFields.values.toList()[index])
              ? Icon(Icons.done, color: Colors.red)
              : null,
        ),
        title: Text(searchController.sortUserFields.keys.toList()[index]),
      ),
    );
  }

  //
}
