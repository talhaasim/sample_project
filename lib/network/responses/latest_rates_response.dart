class LatestRatesResponse {
  LatestRatesResponse({
    this.disclaimer,
    this.license,
    this.timestamp,
    this.base,
    this.rates,
  });

  String? disclaimer;
  String? license;
  int? timestamp;
  String? base;
  Map<String, dynamic>? rates;

  factory LatestRatesResponse.fromJson(Map<String, dynamic> json) {
    return LatestRatesResponse(
      disclaimer: json['disclaimer'],
      license: json['license'],
      timestamp: json['timestamp'],
      base: json['base'],
      rates: json['rates'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['disclaimer'] = disclaimer;
    data['license'] = license;
    data['timestamp'] = timestamp;
    data['base'] = base;
    data['rates'] = rates;
    return data;
  }
}
