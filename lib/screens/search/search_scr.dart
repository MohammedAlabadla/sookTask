import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sookps/controllers/search_controller.dart';
import 'package:sookps/screens/repositories/components/repositry_w.dart';
import 'package:sookps/screens/search/components/search_bar_w.dart';
import 'package:sookps/screens/widgets/loading_widget.dart';

import 'components/filter_sheet_w.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  //
  final searchController = Get.find<SearchController>();
  //
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      searchController.page = 1;
      searchController.repos.clear();
      searchController.selectedSortField =
          searchController.sortFields['best match']!;
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
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: SearchBarWidget()),
                    SizedBox(width: 10),
                    FilterSheet(),
                  ],
                ),
                SizedBox(height: 20),
                //
                Expanded(
                  child: ListView.separated(
                    itemCount: searchController.repos.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                      child: Divider(color: Colors.black38),
                    ),
                    itemBuilder: (context, index) => RepositoryItem(
                      repo: searchController.repos[index],
                    ),
                  ),
                ),
                //
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
