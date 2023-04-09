import 'package:flutter/material.dart';
import 'package:sookps/screens/repositories/components/repositry_w.dart';
import 'package:sookps/screens/search/components/search_bar_w.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Colors.cyan.shade600,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SearchBarWidget(),
            SizedBox(height: 20),
            //
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                  child: Divider(color: Colors.black38),
                ),
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) => RepositoryItem(),
              ),
            ),
            //
            //
          ],
        ),
      ),
    );
  }
}
