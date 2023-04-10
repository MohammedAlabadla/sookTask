import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/search_controller.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({super.key});
  final searchController = Get.find<SearchController>();

  // FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
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
          prefixIcon: Icon(Icons.search, color: Colors.black54, size: 25),
          border: UnderlineInputBorder(borderSide: BorderSide.none),
          hintText: 'repository name, description, or owner',
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
              await searchController.searchRepo();
            },
          );
        },
      ),
    );
  }
}
