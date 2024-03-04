class BaseResponse {
  int? responseCode;
  String? responseMessage;

  BaseResponse({required this.responseCode, required this.responseMessage});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    responseCode = json['statusCode'];
    responseMessage = json['statusText'];
  }

  Map<String, dynamic> toJson() {
    final body = <String, dynamic>{};
    body['response_code'] = responseCode;
    body['response_message'] = responseMessage;

    return body;
  }

  bool get isOK=>responseCode ==200;
}
