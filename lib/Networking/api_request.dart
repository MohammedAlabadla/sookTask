import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sookps/configs/repo_fetch_config.dart';

import 'connectivity.dart';
import 'status_request.dart';

class ApiRequest {
  ///
  // .. get-request
  static Future<RResponse> get(String path,
      {Map<String, dynamic>? params}) async {
    final Dio dio = Dio();
    dio.options.headers['accept'] = 'application/vnd.github+json';
    dio.options.headers['X-GitHub-Api-Version'] = '2022-11-28';
    dio.options.headers['Authorization'] = 'Bearer ${ReposfetchConfig.token}';
    dio.options.queryParameters = params ?? {};

    if (await Reachability.isInternetConected()) {
      log(path);
      Response response;
      try {
        response = await dio.get(path);
        return RResponse(ViewStatus.success, response);
      } on DioError catch (e) {
        return RResponse(ViewStatus.serverFailure, e.response);
      }
    } else {
      return const RResponse(ViewStatus.offline, null);
    }
  }
}

//
class RResponse {
  final ViewStatus statusRequest;
  final Response? response;
  const RResponse(this.statusRequest, this.response);
}
