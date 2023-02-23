import 'package:petdemo/data/strings/app_strings.dart';

class DataResult {
  String status;
  int code;
  String message;
  dynamic data;
  int? total;

  DataResult({required this.status, required this.code, this.message = '', this.data, this.total});

  factory DataResult.fromJson(Map<String, dynamic> json) {
    return DataResult(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      data: json['data'],
      total: json['total'],
    );
  }

  factory DataResult.error() => DataResult(status: 'INVALID', code: 400, message: Strings.errorMessage.get);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'code': code,
      'message': message,
      'data': data,
      'total': total,
    };
  }

  bool get isOK => status == 'OK';

  bool get isShowMessage => status == 'SHOW_MESSAGE';

  bool get isSuccess => code == 200 || code == 304 || isOK;
}

class PagingData {
  int? page;
  int? limit;
  int? total;
  List items;

  PagingData({required this.page, required this.limit, required this.items, this.total});

  factory PagingData.fromJson(Map<String, dynamic> json) {
    return PagingData(
      page: json['status'],
      limit: json['code'],
      items: json['items'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': page,
      'code': limit,
      'items': items,
      'total': total,
    };
  }
}
