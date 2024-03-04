import 'package:get/get_connect/connect.dart';

abstract class BaseApiService extends GetConnect {
  BaseApiService() {
    timeout = const Duration(seconds: 30);
  }

  Future<dynamic> getApi(String url);

  Future<dynamic> postApi(dynamic data, String url);

  var baseUrl = "https://openexchangerates.org/api/";
}
