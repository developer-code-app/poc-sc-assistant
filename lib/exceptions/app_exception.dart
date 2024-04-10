import 'dart:io';
import 'package:flutter/foundation.dart';

class AppException implements Exception {
  AppException([Object? error]) : this._(error, cleanErrorMessage(error));
  AppException._([this.error, this.message = '']);
  AppException.message(String message) : this._(null, message);
  String get prefix => runtimeType.toString();

  final dynamic error;
  final String message;
  static String cleanErrorMessage(Object? error) {
    if (error is String) {
      return error;
    } else if (error is SocketException) {
      return error.message;
    } else if (error is Exception) {
      final type = error.runtimeType.toString();
      return error
          .toString()
          .replaceFirst('$type:', '')
          .replaceFirst(type, '')
          .trim();
    } else if (error is Error) {
      final type = error.runtimeType.toString();
      return error
          .toString()
          .replaceFirst('$type:', '')
          .replaceFirst(type, '')
          .trim();
    } else {
      return '';
    }
  }

  @override
  String toString() {
    if (message.isNotEmpty) {
      return message;
    } else if (kDebugMode) {
      if (error != null) {
        return '$prefix: $error';
      } else {
        return prefix;
      }
    } else {
      return 'Something went wrong.';
    }
  }
}
