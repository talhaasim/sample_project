import 'package:exchange_rate_app/utils/constants.dart';

import 'base_api_service.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future<dynamic> getApi(String url) async {
    print("URL = $url");
    Future<Object>? response;
    await get(url, query: Map()..['app_id'] = AppConstants.appId).then((value) {
      print("RESPONSE = $value");
      if (value.isOk) {
        response = Future.value(value.body);
      }
    });
    return response;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    print("URL = $url");
    print("DATA = $data");
  }
}
