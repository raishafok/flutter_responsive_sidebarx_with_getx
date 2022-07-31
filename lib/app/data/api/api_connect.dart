import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../../utils/protocol_constants.dart';
import 'api_error.dart';

class ApiConnect extends GetConnect {
  static final ApiConnect instance = ApiConnect._();
  dynamic _reqBody;

  ApiConnect._() {
    baseUrl = ProtocolConstants.baseUrl;
    logPrint = print;
    timeout = ProtocolConstants.timeout;

    httpClient.addRequestModifier<dynamic>((request) {
      logPrint('************** Request **************');
      _printKV('uri', request.url);
      _printKV('method', request.method);
      _printKV('followRedirects', request.followRedirects);
      logPrint('headers:');
      request.headers.forEach((key, v) => _printKV(' $key', v));
      logPrint('data:');
      if (_reqBody is Map) {
        _reqBody?.forEach((key, v) => _printKV(' $key', v));
      } else {
        _printAll(_reqBody.toString());
      }
      logPrint('*************************************');
      return request;
    });

    httpClient.addResponseModifier((request, response) {
      logPrint('************** Response **************');
      _printKV('uri', response.request!.url);
      _printKV('statusCode', response.statusCode!);
      if (response.headers != null) {
        logPrint('headers:');
        response.headers?.forEach((key, v) => _printKV(' $key', v));
      }
      logPrint('Response Text:');
      _printAll(response.bodyString);
      logPrint('*************************************');
      return response;
    });
  }

  late void Function(Object object) logPrint;

  @override
  Future<Response<T>> get<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
  }) {
    _checkIfDisposed();

    Map<String, String> _headers = headers ?? <String, String>{};
    // _headers["Authorization"] = "Bearer " + HiveAdapter.getAccessToken();

    _reqBody = query;
    return httpClient.get<T>(
      url,
      headers: _headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
    )..whenComplete(() => _reqBody = null);
  }

  @override
  Future<Response<T>> delete<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
  }) {
    _checkIfDisposed();

    Map<String, String> _headers = headers ?? <String, String>{};
    // _headers["Authorization"] = "Bearer " + HiveAdapter.getAccessToken();

    _reqBody = query;
    return httpClient.delete<T>(
      url,
      headers: _headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
    )..whenComplete(() => _reqBody = null);
  }

  @override
  Future<Response<T>> post<T>(
    String? url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) {
    _checkIfDisposed();

    Map<String, String> _headers = headers ?? <String, String>{};
    // _headers["Authorization"] = "Bearer " + HiveAdapter.getAccessToken();
    try {
      _reqBody = body;
    } catch (e) {
      // print(e.toString());
    }

    return httpClient.post<T>(
      url,
      body: body,
      headers: _headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
      uploadProgress: uploadProgress,
    )..whenComplete(() => _reqBody = null);
  }

  @override
  Future<Response<T>> put<T>(
    String url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) {
    _checkIfDisposed();

    Map<String, String> _headers = headers ?? <String, String>{};
    // _headers["Authorization"] = "Bearer " + HiveAdapter.getAccessToken();

    _reqBody = body;

    return httpClient.put<T>(
      url,
      body: body,
      headers: _headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
      uploadProgress: uploadProgress,
    )..whenComplete(() => _reqBody = null);
  }

  void _printKV(String key, Object v) {
    logPrint('$key: $v');
  }

  void _printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }

  void _checkIfDisposed() {
    if (isDisposed) {
      throw 'Can not emit events to disposed clients';
    }
  }
}

extension ResErr<T> on Response<T> {
  T getBody() {
    if (status.connectionError) {
      throw NoConnectionError();
    }

    if (status.isUnauthorized) {
      throw UnauthorizedError();
    }

    if (status.code == HttpStatus.badRequest) {
      final res = jsonDecode(bodyString!);
      throw ServerResError(res.toString());
    }

    if (status.code == HttpStatus.requestTimeout) {
      throw TimeoutError();
    }

    if (!status.isOk) {
      throw UnknownError();
    }

    try {
      final res = jsonDecode(bodyString!);

      if (res is Map && res['valid'] != null && !res['valid']) {
        throw ServerResError(res['message']);
      }

      return body!;
    } on TimeoutException catch (_) {
      throw TimeoutError();
    } catch (_) {
      throw UnknownError();
    }
  }
}
