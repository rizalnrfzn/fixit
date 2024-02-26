// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';

class ErrorHandler implements Exception {
  late String message;

  ErrorHandler.handle(dynamic e) {
    if (e is DioException) {
      // dio error so its an error from response of the API or from dio itself
      message = _getMessage(e);
    } else {
      // default error
      message = e.toString();
    }
  }
}

String _getMessage(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return MessageStrings.strTimeoutError;
    case DioExceptionType.sendTimeout:
      return MessageStrings.strTimeoutError;
    case DioExceptionType.receiveTimeout:
      return MessageStrings.strTimeoutError;
    case DioExceptionType.badResponse:
      if (e.response != null &&
          e.response?.statusCode != null &&
          e.response?.statusMessage != null) {
        return '${e.response?.statusMessage}';
      } else {
        return MessageStrings.strDefaultError;
      }
    case DioExceptionType.cancel:
      return MessageStrings.strDefaultError;
    case DioExceptionType.unknown:
      return MessageStrings.strDefaultError;
    case DioExceptionType.badCertificate:
      return MessageStrings.strDefaultError;
    case DioExceptionType.connectionError:
      return MessageStrings.strNoInternetError;
    default:
      return MessageStrings.strDefaultError;
  }
}

class MessageStrings {
  static const String success = "success";
  // error handler
  static const String strBadRequestError = "Terjadi kesalahan";
  static const String strNoContent = "no_content";
  static const String strForbiddenError = "forbidden_error";
  static const String strUnauthorizedError = "unauthorized_error";
  static const String strNotFoundError = "not_found_error";
  static const String strConflictError = "conflict_error";
  static const String strInternalServerError = "internal_server_error";
  static const String strUnknownError = "unknown_error";
  static const String strTimeoutError =
      "Waktu tunggu terlalu lama, mohon ulangi lagi.";
  static const String strDefaultError = "Terjadi kesalahan";
  static const String strCacheError = "cache_error";
  static const String strNoInternetError =
      "Tidak ada koneksi internet, mohon nyalakan wifi atau data seluler Anda.";
}
