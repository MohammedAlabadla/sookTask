import 'package:flutter/material.dart';
import 'package:sookps/Networking/progress.dart';
import 'package:sookps/screens/repositories/components/repositry_w.dart';
import 'package:sookps/screens/repositories/components/search_btn_w.dart';

class RepositoriesScreen extends StatelessWidget {
  const RepositoriesScreen({super.key});

  //
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Repos'),
        backgroundColor: Colors.cyan.shade600,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.refresh),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SearchBarBtnWidget(),
            SizedBox(height: 20),
            Row(
              children: const [
                Text(
                  '20 repository results of Google',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Divider(color: Colors.black),
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
          ],
        ),
      ),
    );
  }

  //

  //
}
