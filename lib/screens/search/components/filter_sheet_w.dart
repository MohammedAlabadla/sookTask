import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/search_controller.dart';

class FilterSheet extends StatelessWidget {
  FilterSheet({super.key});

  final searchController = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.filter_list),
      onPressed: () {
        showModalBottomSheet(
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
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 15),
                const Text(
                  'Sort Option',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const Divider(color: Colors.black54),
                Expanded(
                  child: ListView.separated(
                    itemCount: searchController.sortFields.length,
                    separatorBuilder: (context, index) =>
                        const Divider(color: Colors.black54),
                    itemBuilder: (context, index) => SizedBox(
                      height: 40,
                      child: ListTile(
                        onTap: () {
                          Get.back();
                          searchController.selectedSortField = searchController
                              .sortFields.values
                              .toList()[index];
                          searchController.searchRepo();
                        },
                        // contentPadding: EdgeInsets.zero,
                        minLeadingWidth: 20,
                        leading: searchController.selectedSortField ==
                                (searchController.sortFields.values
                                    .toList()[index])
                            ? const SizedBox(
                                width: 10,
                                child: Icon(Icons.done, color: Colors.red))
                            : const SizedBox(width: 10),
                        title: Text(
                          searchController.sortFields.keys.toList()[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
