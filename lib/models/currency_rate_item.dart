class CurrencyRatesItem {
  CurrencyRatesItem({
    this.currency,
    this.rate,
  });

  String? currency;
  double? rate;

  factory CurrencyRatesItem.fromJson(Map<String, dynamic> json) {
    return CurrencyRatesItem(
      currency: json['currency'],
      rate: json['rate'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currency'] = currency;
    data['rate'] = rate;
    return data;
  }
}
