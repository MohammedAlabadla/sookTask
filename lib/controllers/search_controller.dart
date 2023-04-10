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
  Rx<StatusRequest> viewStatus = StatusRequest.ideal.obs;
  //
  Map<String, String> selectedSortField = {};
  final sortFields = {
    'best match': {'sort': '', 'order': ''},
    'Most stars': {'sort': 'stars', 'order': 'desc'},
    'Fewest stars': {'sort': 'stars', 'order': 'asc'},
    'Most forks': {'sort': 'forks', 'order': 'desc'},
    'Fewest forks': {'sort': 'forks', 'order': 'asc'},
    'Recently updated': {'sort': 'updated', 'order': 'desc'},
    'Least recently updated': {'sort': 'updated', 'order': 'asc'},
  };

  //
  RxList<Repo> repos = <Repo>[].obs;
  int page = 1;
  int perPage = 27;
  final searchTxtEdiCtrl = TextEditingController();
  //
  searchRepo() async {
    // if (viewStatus.value == StatusRequest.loading) return;
    if (searchTxtEdiCtrl.text.isEmpty) {
      ShowToast.show(msg: 'Enter search text ..!');
      return;
    }
    viewStatus(StatusRequest.loading);
    var params = {
      'q': searchTxtEdiCtrl.text,
      'page': page,
      'per_page': perPage,
      ...selectedSortField
    };
    RResponse response = await ApiRequest.get(ApiUrl.search, params: params);
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

  ///
}
