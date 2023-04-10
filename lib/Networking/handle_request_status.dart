import 'api_request.dart';
import 'show_toast.dart';
import 'status_request.dart';

Future handleRequestStatus(RResponse response, {Function()? onSucsses}) async {
  if (response.statusRequest == StatusRequest.success) {
    onSucsses!();
  } else if (response.statusRequest == StatusRequest.serverFailure) {
    String msg = response.response!.data['message'] ?? 'Server Error';
    ShowToast.show(msg: msg, isSuccess: false);
  } else {
    ShowToast.show(msg: 'No internet connectivity', isSuccess: false);
  }
}
