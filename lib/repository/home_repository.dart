import 'dart:ffi';

import 'package:exchange_rate_app/network/network_api_service.dart';
import 'package:exchange_rate_app/storage/get_storage_expension.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/src/material/bottom_sheet.dart' as flutter_bottom_sheet;
import '../components/dropdown.dart';
import '../main.dart';
import '../models/currency_rate_item.dart';
import '../network/responses/latest_rates_response.dart';

class HomeRepository extends ChangeNotifier {
  final _apiService = NetworkApiService();
  CurrencyRatesItem currentCurrency = CurrencyRatesItem(
    currency: "USD",
    rate: 1.0,
  );
  List<CurrencyRatesItem>? currencies;

  Future<dynamic> getLatestExchangeRates() async {
    await _apiService.getApi("latest.json").then((value) {
      LatestRatesResponse latestData = LatestRatesResponse.fromJson(value);
      storage?.saveLatestFetch(latestData);
    });
  }

  bool canFetchLatestData() {
    var rateResponse = storage?.getLatestFetch();
    var nextFetch = rateResponse!.timestamp! + (30 * 60 * 1000);
    var currentTime = DateTime.now().millisecondsSinceEpoch;
    if (currentTime > nextFetch) {
      return false;
    } else {
      return true;
    }
  }

  setCurrentCurrency(CurrencyRatesItem currentCurrency) {
    this.currentCurrency = currentCurrency;
    currencies = [];
    notifyListeners();
  }

  Future<List<CurrencyRatesItem>> getCurrencies() {
    var rateResponse = storage?.getLatestFetch();
    List<String> keys = rateResponse!.rates!.keys.toList();
    List<CurrencyRatesItem> options = <CurrencyRatesItem>[];
    for (int i = 0; i < keys.length; i++) {
      String currency = keys[i];
      double value =
          double.parse((rateResponse.rates![currency]).toStringAsFixed(4));
      var currencyItem = CurrencyRatesItem(currency: currency, rate: value);
      options.add(currencyItem);
    }
    currencies = options;
    return Future.value(options);
  }

  showCurrencySheet(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    List<CurrencyRatesItem> options = await getCurrencies();

    if (context.mounted) {
      flutter_bottom_sheet.showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return CurrencyDropDownList(
            currentCurrency,
            options,
            (CurrencyRatesItem currency) {
              setCurrentCurrency(currency);
              notifyListeners();
            },
          );
        },
      );
    }
  }

  performConversion(CurrencyRatesItem currentCurrency, String value) async {
    FocusManager.instance.primaryFocus?.unfocus();
    await getCurrencies();
    List<CurrencyRatesItem>? convertedCurrencies = [];
    var inUsd = double.parse(value) / currentCurrency.rate!;
    for (int i = 0; i < currencies!.length; i++) {
      var currency =
          double.parse((inUsd * currencies![i].rate!).toStringAsFixed(4));
      var currencyItem =
          CurrencyRatesItem(currency: currencies![i].currency, rate: currency);
      convertedCurrencies.add(currencyItem);
    }
    currencies!.clear();
    currencies!.addAll(convertedCurrencies);
    notifyListeners();
  }

  clearAll() async {
    FocusManager.instance.primaryFocus?.unfocus();
    currencies!.clear();
    notifyListeners();
  }
}
