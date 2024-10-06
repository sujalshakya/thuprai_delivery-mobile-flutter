class OrderStatusChangeResponse {
  String? status;
  String? error;

  OrderStatusChangeResponse({this.status, this.error});

  OrderStatusChangeResponse.fromJson(dynamic json) {
    status = json["status"];
    error = json["error"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["error"] = error;
    return map;
  }

  OrderStatusChangeResponse.withError(String this.error) : status = "";
}
