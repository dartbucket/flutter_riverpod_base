import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/global/providers/common_providers.dart';
import 'package:flutter_riverpod_base/src/res/strings.dart';
import 'package:flutter_riverpod_base/src/utils/config.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';

import 'core.dart';

/// Watch apiProvider to make sure to have the latest authToken passed.

// TODO: prefer wraping this into a class instead of using a global variable.
final networkRepoProvider = StateProvider((ref) {
  final authToken = ref.watch(authTokenProvider);

  return NetworkRepo(authToken: authToken);
});

// TODO: don't abbreviate, use NetworkRepository instead.
// TODO: too many duplicate your could write a wrapper.

/// Contains common methods required for client side APIs [GET, POST, PUT, DELETE].
/// Pass the [url] from endpoints using [Endpoints] class.
/// Every method has an optional parameter [requireAuth] default [true].
/// Set [requireAuth] to [false] if [authToken] is Empty.
class NetworkRepo {
  final String? _authToken;

// TODO: prefer using const constructor.
  NetworkRepo({required String? authToken}) : _authToken = authToken;

  FutureEither<Response> getRequest({
    required String url,
    bool requireAuth = true,
  }) async {
    final requestHeaders = {
      "Content-Type": "application/json",
      "Cookie": "token=$_authToken",
    };
    if (requireAuth && (_authToken ?? '').isEmpty) {
      return Left(Failure(message: FailureMessage.authTokenEmpty));
    }
    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpGet);
      log('requireAuth : $requireAuth', name: LogLabel.httpGet);
    }
    try {
      final response = await get(Uri.parse(url), headers: requestHeaders);
      log('RESPONSE : ${response.body}', name: LogLabel.httpGet);

      return Right(response);
    } catch (e, stktrc) {
      return Left(Failure(
        message: FailureMessage.getRequestMessage,
        stackTrace: stktrc,
      ));
    }
  }

  FutureEither<Response> postRequest({
    required String url,
    // TODO: avoid dynamic use <T> instead. (generic type).
    dynamic body,
    bool requireAuth = true,
  }) async {
    final requestHeaders = {
      "Content-Type": "application/json",
      // TODO: _authToken is nullable, you should check for nullability.
      "Cookie": "token=$_authToken",
    };
    if (requireAuth && (_authToken ?? '').isEmpty) {
      return Left(Failure(message: FailureMessage.authTokenEmpty));
    }
    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpPost);
      log('requireAuth : $requireAuth', name: LogLabel.httpPost);
      log('BODY : $body', name: LogLabel.httpPost);
    }
    try {
      final response = await post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: requestHeaders,
      );
      log('RESPONSE : ${response.body}', name: LogLabel.httpPost);

      return Right(response);
      // TODO: don't abbreviate, use stacktrace instead.
    } catch (e, stktrc) {
      return Left(Failure(
        message: FailureMessage.postRequestMessage,
        stackTrace: stktrc,
      ));
    }
  }

  FutureEither<Response> putRequest({
    required String url,
    dynamic body,
    bool requireAuth = true,
  }) async {
    final requestHeaders = {
      "Content-Type": "application/json",
      "Cookie": "token=$_authToken",
    };
    if (requireAuth && (_authToken ?? '').isEmpty) {
      return Left(Failure(message: FailureMessage.authTokenEmpty));
    }
    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpPut);
      log(
        'requireAuth : $requireAuth',
        name: LogLabel.httpPut,
      );
      log('BODY : $body', name: LogLabel.httpPut);
    }
    try {
      final response = await put(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: requestHeaders,
      );
      log('RESPONSE : ${response.body}', name: LogLabel.httpPut);

      return Right(response);
    } catch (e, stktrc) {
      return Left(Failure(
        message: FailureMessage.putRequestMessage,
        stackTrace: stktrc,
      ));
    }
  }

  FutureEither<Response> deleteRequest({
    required String url,
    dynamic body,
    bool requireAuth = true,
  }) async {
    final requestHeaders = {
      "Content-Type": "application/json",
      "Cookie": "token=$_authToken",
    };
    if (requireAuth && (_authToken ?? '').isEmpty) {
      return Left(Failure(message: FailureMessage.authTokenEmpty));
    }
    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpDelete);
      log('requireAuth : $requireAuth', name: LogLabel.httpDelete);
      log('BODY : $body', name: LogLabel.httpDelete);
    }
    try {
      final response = await delete(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: requestHeaders,
      );
      log('RESPONSE : ${response.body}', name: LogLabel.httpDelete);

      return Right(response);
    } catch (e, stktrc) {
      return Left(Failure(
        message: FailureMessage.deleteRequestMessage,
        stackTrace: stktrc,
      ));
    }
  }
}
