import 'package:get/get.dart';
import '../Networking/api_request.dart';
import '../Networking/api_url.dart';
import '../Networking/handle_request_status.dart';
import '../Networking/status_request.dart';

class RepositoriesController extends GetxController {
  // status
  Rx<StatusRequest> viewStatus = StatusRequest.ideal.obs;
  //

  getCManufactory() async {
    viewStatus(StatusRequest.loading);
    var params = {'q': ''};
    RResponse response = await ApiRequest.get(ApiUrl.fetchRepo, params: params);
    await handleRequestStatus(
      response,
      onSucsses: () {},
    );
    viewStatus(response.statusRequest);
  }

  ///
}
