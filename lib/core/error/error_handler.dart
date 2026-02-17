import 'dart:convert';

import 'package:dio/dio.dart';
import 'error_massage.dart';
import 'error_model.dart';

class ErrorHandler {
  ErrorHandler._();

  static ErrorModel formException(Exception exception) {
    if (exception is DioException) {
      return _formDioExceptions(exception);
    } else {
      return ErrorModel(errorMassage: ErrorMassage.unknownErrorMessage);
    }
  }

  static ErrorModel _formDioExceptions(DioException dioExceptions) {
    switch (dioExceptions.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ErrorModel(errorMassage: ErrorMassage.connectionErrorMessage);
      case DioExceptionType.badCertificate:
        return ErrorModel(errorMassage: ErrorMassage.badCertificateMessage);
      case DioExceptionType.badResponse:
        return _handleResponse(dioExceptions.response);
      case DioExceptionType.connectionError:
        return ErrorModel(errorMassage: ErrorMassage.connectionErrorMessage);
      default:
        return ErrorModel(errorMassage: ErrorMassage.unknownErrorMessage);
    }
  }

  static ErrorModel _handleResponse(Response? response) {
    if (response != null) {
      return _formResponse(response);
    } else {
      return ErrorModel(errorMassage: ErrorMassage.unknownErrorMessage);
    }
  }


  static ErrorModel _formResponse(Response response) {
    final statusCode = response.statusCode;
    dynamic responseData = response.data;
    String? serverMessage;

    try {
      // 1. التأكد من تحويل البيانات إلى Map
      if (responseData is String) {
        responseData = jsonDecode(responseData);
      }

      if (responseData is Map<String, dynamic>) {
        // 2. الوصول للرسالة أو أول خطأ في مصفوفة الأخطاء
        serverMessage = responseData["message"];

        if (responseData["errors"] != null &&
            responseData["errors"] is List &&
            (responseData["errors"] as List).isNotEmpty) {
          serverMessage = responseData["errors"][0]["message"];
        }
      }
    } catch (e) {
      // في حال فشل التحليل (Parsing)
      serverMessage = null;
    }

    // 3. الأولوية للرسالة القادمة من السيرفر (المستخدم موجود بالفعل)
    if (serverMessage != null && serverMessage.isNotEmpty) {
      return ErrorModel(
        errorMassage: serverMessage,
        code: statusCode ?? 400,
      );
    }

    // 4. Fallback للرسائل الافتراضية بناءً على الـ Status Code
    switch (statusCode) {
      case 409:
        return ErrorModel(errorMassage: ErrorMassage.conflictMessage, code: 409);
      case 400:
        return ErrorModel(errorMassage: ErrorMassage.badResponseMassage, code: 400);
      default:
        return ErrorModel(errorMassage: ErrorMassage.unknownErrorMessage);
    }
  }}