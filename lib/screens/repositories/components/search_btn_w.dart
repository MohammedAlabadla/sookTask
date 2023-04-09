import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../search/search_scr.dart';

class SearchBarBtnWidget extends StatelessWidget {
  const SearchBarBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => SearchScreen()),
      child: Container(
        height: 50,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: const [
            Icon(Icons.search, color: Colors.black54),
            SizedBox(width: 10),
            Text('search ...'),
          ],
        ),
      ),
    );
  }
}
