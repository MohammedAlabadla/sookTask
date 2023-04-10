import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sookps/controllers/repositories_controller.dart';
import 'package:sookps/screens/repositories/components/repositry_w.dart';
import 'package:sookps/screens/repositories/components/search_btn_w.dart';
import 'package:sookps/screens/widgets/loading_widget.dart';

import 'components/no_repo_w.dart';

class RepositoriesScreen extends StatelessWidget {
  RepositoriesScreen({super.key});
  //
  final repoController = Get.find<RepositoriesController>();
  //
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      repoController.page = 1;
      repoController.repos.clear();
      repoController.fetchGoogleRepo();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Repos'),
        backgroundColor: Colors.cyan.shade600,
        leading: IconButton(
          onPressed: () {
            repoController.page = 1;
            repoController.repos.clear();
            repoController.fetchGoogleRepo();
          },
          icon: Icon(Icons.refresh),
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          statusRequest: repoController.viewStatus.value,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SearchBarBtnWidget(),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      '${repoController.repos.length} repository results of Google',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Divider(color: Colors.black),
                //
                repoController.repos.isEmpty
                    ? NoRepoWidget()
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
          repoController.page += 1;
          repoController.fetchGoogleRepo();
        }
        return false;
      },
      child: Expanded(
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
            child: Divider(color: Colors.black38),
          ),
          itemCount: repoController.repos.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => RepositoryItem(
            repo: repoController.repos[index],
          ),
        ),
      ),
    );
  }
  //
  //
}
