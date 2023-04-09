import 'dart:developer';

import 'package:dio/dio.dart';

import 'connectivity.dart';
import 'status_request.dart';

class ApiRequest {
  /////////////.............
  ///
  ///
  // .. get-request
  static Future<RResponse> get(String path,
      {Map<String, dynamic>? params}) async {
    final Dio dio = Dio();
    dio.options.contentType = 'application/json';
    dio.options.headers['accept'] = 'application/json';

    if (params?.isNotEmpty ?? false) dio.options.queryParameters = params!;
    if (await Reachability.isInternetConected()) {
      log(path);

      Response response;
      try {
        response = await dio.get(path);
        return RResponse(StatusRequest.success, response);
      } on DioError catch (e) {
        return RResponse(StatusRequest.serverFailure, e.response);
      }
    } else {
      return const RResponse(StatusRequest.offline, null);
    }
  }
}

//
class RResponse {
  final StatusRequest statusRequest;
  final Response? response;
  const RResponse(this.statusRequest, this.response);
}
