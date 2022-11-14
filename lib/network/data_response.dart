class DataResponse {
  late int result;
  late String message;
  late dynamic data;

  DataResponse(
      {required this.result, required this.message, required this.data});

  DataResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['result'] = result;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
