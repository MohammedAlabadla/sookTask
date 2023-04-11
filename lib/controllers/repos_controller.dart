import 'package:get/get.dart';
import 'package:sookps/configs/repo_fetch_config.dart';
import 'package:sookps/models/repo.dart';
import '../Networking/api_request.dart';
import '../Networking/api_url.dart';
import '../Networking/handle_request_status.dart';
import '../Networking/status_request.dart';

class ReposController extends GetxController {
  // status
  Rx<ViewStatus> viewStatus = ViewStatus.ideal.obs;
  //
  List<Repo> repos = [];
  int page = 1;
  int perPage = 20;

  fetchGoogleRepo() async {
    if (viewStatus.value == ViewStatus.loading) return;
    viewStatus(ViewStatus.loading);
    var params = {'page': page, 'per_page': perPage};
    RResponse response = await ApiRequest.get(
      '${ApiUrl.fetchRepo}/${ReposfetchConfig.orgSearchName}/repos',
      params: params,
    );
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
