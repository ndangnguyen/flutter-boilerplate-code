import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:petdemo/commons/constants.dart';

class DioInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final bool hasInternet = await _checkInternetConnection();

    if (!hasInternet) {
      return;
    }

    // if (LocalData.shared.isLogged) {
    //   options.headers[AppConsts.headerCookie] = "user=" + Uri.encodeComponent(jsonEncode(LocalData.shared.userData?.toJson()));
    // }

    options
      ..connectTimeout =
          const Duration(milliseconds: AppConsts.connectionTimeout)
      ..receiveTimeout = const Duration(milliseconds: AppConsts.receiveTimeout)
      ..headers[AppConsts.headerDevice] = AppConsts.device
      ..headers[AppConsts.headerOS] = AppConsts.os
      ..headers[AppConsts.headerBrowser] = AppConsts.browser
      ..headers[AppConsts.headerUserAgent] = AppConsts.userAgent;

    return super.onRequest(options, handler);
  }

  Future<bool> _checkInternetConnection() async {
    final result = await Connectivity().checkConnectivity();
    final hasInternet = result != ConnectivityResult.none;
    return hasInternet;
  }
}
