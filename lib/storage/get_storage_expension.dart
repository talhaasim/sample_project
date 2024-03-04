import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../network/responses/latest_rates_response.dart';

extension GetStorageExtensions on GetStorage {
  void saveLatestFetch(LatestRatesResponse rates) {
    write("latestFetch", json.encode(rates ?? ''));
  }

  LatestRatesResponse? getLatestFetch() {
    var ratesStr = read("latestFetch");
    print("latest fetch = $ratesStr");
    if (ratesStr == null) return null;
    return LatestRatesResponse.fromJson(json.decode(ratesStr));
  }
}
