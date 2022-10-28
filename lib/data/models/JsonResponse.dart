class JsonResponse {
  JsonResponse({
    this.respCode,
    this.respDesc,
  });

  JsonResponse.fromJson(dynamic json) {
    respCode = json['resp_code'];
    respDesc = json['resp_desc'];
  }
  String? respCode;
  String? respDesc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resp_code'] = respCode;
    map['resp_desc'] = respDesc;
    return map;
  }
}
