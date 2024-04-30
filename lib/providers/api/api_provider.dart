import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:poc_sc_assistant/providers/api/services/home_service.dart';
import 'package:poc_sc_assistant/providers/api/services/user_service.dart';

class ApiProvider {
  ApiProvider(Dio dio)
      : home = HomeService(dio),
        user = UserService(dio);

  factory ApiProvider.basic() {
    const baseUrl = 'http://m1mini.local:8081/sc_assistant/';
    final interceptors = [
      if (kDebugMode)
        LogInterceptor(
          requestBody: true,
          responseHeader: false,
          responseBody: true,
        ),
    ];

    return ApiProvider(
      _createClient(
        baseUrl: baseUrl,
      )..interceptors.addAll(interceptors),
    );
  }

  ApiProvider.mock({bool isSupportedLocale = false})
      : this(
          _createClient(
            baseUrl:
                'https://baanruejai-dev.scasset.com/global-network-service/',
          )..interceptors.addAll(
              [
                if (kDebugMode &&
                    !Platform.environment.containsKey('FLUTTER_TEST'))
                  LogInterceptor(responseHeader: false),
              ],
            ),
        );

  static Dio _createClient({required String baseUrl}) => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          contentType: 'application/json',
          connectTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );

  final HomeService home;
  final UserService user;
}
