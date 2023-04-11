import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sookps/Networking/show_toast.dart';
import 'package:sookps/models/repo.dart';
import '../Networking/api_request.dart';
import '../Networking/api_url.dart';
import '../Networking/handle_request_status.dart';
import '../Networking/status_request.dart';

class SearchController extends GetxController {
  // status
  Rx<ViewStatus> viewStatus = ViewStatus.ideal.obs;
  //
  //
  RxBool isSearchForRepo = true.obs;
  Map<String, String> selectedRepoSortField = {};
  Map<String, String> selectedUserSortField = {};
  int page = 1;
  int perPage = 27;
  final searchTxtEdiCtrl = TextEditingController();

  //======================= search-repo ================================
  RxList<Repo> repos = <Repo>[].obs;
  //
  searchForRepos() async {
    // if (viewStatus.value == StatusRequest.loading) return;
    if (searchTxtEdiCtrl.text.isEmpty) {
      ShowToast.show(msg: 'Enter search text ..!');
      return;
    }
    viewStatus(ViewStatus.loading);
    var params = {
      'q': searchTxtEdiCtrl.text,
      'page': page,
      'per_page': perPage,
      ...selectedRepoSortField
    };
    RResponse response =
        await ApiRequest.get(ApiUrl.searchRepos, params: params);
    handleRequestStatus(
      response,
      onSucsses: () {
        repos.value = List<Repo>.from(
          response.response?.data['items'].map((r) => Repo.fromJson(r)),
        );
        if (searchTxtEdiCtrl.text.isEmpty) repos.clear();
      },
    ).whenComplete(() => viewStatus(response.statusRequest));
  }

  //
  //======================= search-users ================================
  RxList<User> users = <User>[].obs;
  //
  searchForUsers() async {
    // if (viewStatus.value == StatusRequest.loading) return;
    if (searchTxtEdiCtrl.text.isEmpty) {
      ShowToast.show(msg: 'Enter search text ..!');
      return;
    }
    viewStatus(ViewStatus.loading);
    var params = {
      'q': searchTxtEdiCtrl.text,
      'page': page,
      'per_page': perPage,
      ...selectedUserSortField
    };
    RResponse response =
        await ApiRequest.get(ApiUrl.searchUser, params: params);
    handleRequestStatus(
      response,
      onSucsses: () {
        users.value = List<User>.from(
          response.response?.data['items'].map((r) => User.fromJson(r)),
        );
        if (searchTxtEdiCtrl.text.isEmpty) users.clear();
      },
    ).whenComplete(() => viewStatus(response.statusRequest));
  }

  //
  //============== SoRt FiElDs ===================
  final sortRepoFields = {
    'best match': {'sort': '', 'order': ''},
    'Most stars': {'sort': 'stars', 'order': 'desc'},
    'Fewest stars': {'sort': 'stars', 'order': 'asc'},
    'Most forks': {'sort': 'forks', 'order': 'desc'},
    'Fewest forks': {'sort': 'forks', 'order': 'asc'},
    'Recently updated': {'sort': 'updated', 'order': 'desc'},
    'Least recently updated': {'sort': 'updated', 'order': 'asc'},
  };
  final sortUserFields = {
    'best match': {'sort': '', 'order': ''},
    'Most followers': {'sort': 'followers', 'order': 'desc'},
    'Fewest followers': {'sort': 'followers', 'order': 'asc'},
    'Most repositories': {'sort': 'repositories', 'order': 'desc'},
    'Fewest repositories': {'sort': 'repositories', 'order': 'asc'},
    'Most recently joined': {'sort': 'joined', 'order': 'desc'},
    'Least recently joined': {'sort': 'joined', 'order': 'asc'},
  };

  ///
}
