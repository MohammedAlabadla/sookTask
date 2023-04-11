import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/search_controller.dart';
import 'filter_sheet_widget.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({super.key});
  final searchController = Get.find<SearchController>();

  // FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: searchController.searchTxtEdiCtrl,
                  autofocus: true,
                  // focusNode: _focusNode,
                  decoration: const InputDecoration(
                    prefixIcon:
                        Icon(Icons.search, color: Colors.black54, size: 25),
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'repository name, description, or users',
                    hintStyle: TextStyle(fontSize: 11),
                    labelStyle: TextStyle(color: Colors.black54, fontSize: 16),
                    // contentPadding: EdgeInsets.only(left: 10, right: 10),
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    Timer(
                      Duration(milliseconds: 500),
                      () async {
                        if (searchController.searchTxtEdiCtrl.text.isEmpty) {
                          searchController.repos.clear();
                          log('value isEmpty');
                          return;
                        }
                        searchController.isSearchForRepo.value
                            ? await searchController.searchForRepos()
                            : await searchController.searchForUsers();
                      },
                    );
                  },
                ),
              ),
            ),
            //
            SizedBox(width: 10.w),
            FilterSheet(),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Text(
              'Search for: ',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 10.w),
            InkWell(
              onTap: () {
                searchController.isSearchForRepo.value = true;
                searchController.users.clear();
              },
              child: Container(
                height: 25.h,
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                decoration: BoxDecoration(
                  color: searchController.isSearchForRepo.value
                      ? Colors.cyan
                      : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(2.r),
                ),
                child: Text(
                  'Repositeries',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            InkWell(
              onTap: () {
                searchController.isSearchForRepo.value = false;
                searchController.repos.clear();
              },
              child: Container(
                height: 25.h,
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                decoration: BoxDecoration(
                  color: searchController.isSearchForRepo.value
                      ? Colors.grey.shade400
                      : Colors.cyan,
                  borderRadius: BorderRadius.circular(2.r),
                ),
                child: Text(
                  'Users',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(color: Colors.black45),
      ],
    );
  }
}
