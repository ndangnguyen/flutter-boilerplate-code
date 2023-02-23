import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:petdemo/data/models/data_result.dart';
import 'package:petdemo/main.dart';
import 'package:petdemo/utils/dio_interceptors.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpResponse<T> {
  HttpResponse({
    required this.body,
    required this.headers,
    required this.request,
    required this.statusCode,
    required this.statusMessage,
    required this.extra,
  });

  T body;
  Headers headers;
  RequestOptions request;
  int statusCode;
  String statusMessage;
  Map<String, dynamic> extra;
}

class HttpHelper {
  static final dio = Dio()
    ..interceptors.addAll([
      DioInterceptors(),
      if (enableLog)
        PrettyDioLogger(
          requestHeader: false,
          requestBody: false,
          responseBody: false,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 150,
        ),
    ]);

  static Future<HttpResponse> getWithoutBaseResponse(String url,
      {Map<String, dynamic>? query}) async {
    final Response response = await dio.get(url, queryParameters: query);
    return HttpResponse(
      body: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode!,
      statusMessage: response.statusMessage!,
      extra: response.extra,
    );
  }

  static Future<DataResult> get(String url,
      {Map<String, dynamic>? query}) async {
    try {
      final Response response = await dio.get(url, queryParameters: query);
      if (response.data is String) {
        response.data = jsonDecode(response.data);
      }
      final dataResult = DataResult.fromJson(response.data);
      if (dataResult.isSuccess) {
        return dataResult;
      }
      throw dataResult;
    } on DataResult {
      rethrow;
    } on DioError catch (error) {
      throw DataResult.fromJson(error.response?.data);
    } catch (_) {
      throw DataResult.error();
    }
  }

  static Future<DataResult> post(String url, {Object? data}) async {
    try {
      final Response response = await dio.post(url, data: data);
      if (response.data is String) {
        response.data = jsonDecode(response.data);
      }
      final dataResult = DataResult.fromJson(response.data);
      if (dataResult.isSuccess) {
        return dataResult;
      }
      throw dataResult;
    } on DataResult {
      rethrow;
    } on DioError catch (error) {
      throw DataResult.fromJson(error.response?.data);
    } catch (_) {
      throw DataResult.error();
    }
  }

  static Future<DataResult> put(String url, {Object? data}) async {
    try {
      final Response response = await dio.put(url, data: data);
      if (response.data is String) {
        response.data = jsonDecode(response.data);
      }
      final dataResult = DataResult.fromJson(response.data);
      if (dataResult.isSuccess) {
        return dataResult;
      }
      throw dataResult;
    } on DataResult {
      rethrow;
    } on DioError catch (error) {
      throw DataResult.fromJson(error.response?.data);
    } catch (_) {
      throw DataResult.error();
    }
  }

  static Future<DataResult> delete(String url, {Object? data}) async {
    try {
      final Response response = await dio.delete(url, data: data);
      if (response.data is String) {
        response.data = jsonDecode(response.data);
      }
      final dataResult = DataResult.fromJson(response.data);
      if (dataResult.isSuccess) {
        return dataResult;
      }
      throw dataResult;
    } on DataResult {
      rethrow;
    } on DioError catch (error) {
      throw DataResult.fromJson(error.response?.data);
    } catch (_) {
      throw DataResult.error();
    }
  }

  static Future<DataResult> uploadFile(String url, {required File file}) async {
    final uploadFile = await MultipartFile.fromFile(
      file.path,
      filename: basename(file.path),
    );
    final formData = FormData.fromMap({'file': uploadFile});
    try {
      final response = await dio.post(url, data: formData);
      if (response.data is String) {
        response.data = jsonDecode(response.data);
      }
      final dataResult = DataResult.fromJson(response.data);
      if (dataResult.isSuccess) {
        return dataResult;
      }
      throw dataResult;
    } on DataResult {
      rethrow;
    } on DioError catch (error) {
      try {
        throw DataResult.fromJson(error.response?.data);
      } catch (_) {
        throw DataResult.error();
      }
    } catch (_) {
      throw DataResult.error();
    }
  }

  static Future download(String url, {required String savePath}) async {
    return dio.download(url, savePath);
  }

  static String getUriQueryParam(Uri uri, String key) {
    final queryParams = uri.queryParametersAll.entries.toList();
    if (queryParams.any((_) => _.key == key)) {
      return queryParams.firstWhere((_) => _.key == key).value.first;
    }
    return "";
  }
}
