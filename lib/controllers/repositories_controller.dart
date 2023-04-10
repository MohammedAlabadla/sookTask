import 'dart:developer';

import 'package:get/get.dart';
import 'package:sookps/models/repo.dart';
import '../Networking/api_request.dart';
import '../Networking/api_url.dart';
import '../Networking/handle_request_status.dart';
import '../Networking/status_request.dart';

class RepositoriesController extends GetxController {
  // status
  Rx<StatusRequest> viewStatus = StatusRequest.ideal.obs;
  //
  List<Repo> repos = [];
  int page = 1;
  int perPage = 20;

  fetchGoogleRepo() async {
    if (viewStatus.value == StatusRequest.loading) return;
    viewStatus(StatusRequest.loading);
    var params = {'page': page, 'per_page': perPage};
    RResponse response = await ApiRequest.get(ApiUrl.fetchRepo, params: params);
    await handleRequestStatus(
      response,
      onSucsses: () {
        repos.addAll(
          List<Repo>.from(
            response.response?.data.map((r) => Repo.fromJson(r)),
          ).toList(),
        );
      },
    ).whenComplete(() => viewStatus(response.statusRequest));
  }

  ///
}
