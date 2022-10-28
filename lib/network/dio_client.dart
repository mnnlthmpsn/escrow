import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:escrow/data/models/JsonResponse.dart';
import 'package:escrow/network/api_constants.dart';
import 'package:escrow/network/network_logging.dart';
import 'package:escrow/shared/utils/logger.dart';

import 'network_exceptions.dart';

class DioClient {
  var log = getLogger('DioClient');

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.kBaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 5000,
      receiveTimeout: 3000
    )
  )..interceptors.addAll([NetworkLogging()]);

  Dio get dio => _dio;

  Future<dynamic> get(
      String uri, {
        Map<String, dynamic>? queryParameters,
      }) async {
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
      );
      log.d(response);
      if (response.statusCode == 200) {
        return response;
      } else {
        response = _parseResponse(response);
      }
      // return response.data;
    } on SocketException {
      throw FetchDataException("A Network Error Occurred");
    } on FormatException {
      throw FetchDataException("Unable to process request");
    } on DioError catch (e) {
      _parseError(e);
    }
  }

  Future<dynamic> post(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
      }) async {
    try {
      var response = await _dio.post(
        uri,
        data: jsonEncode(data),
        queryParameters: queryParameters,
      );
      log.d(response);
      if (response.statusCode == 200) {
        return response;
      } else {
        response = _parseResponse(response);
      }
    } on SocketException {
      throw FetchDataException("A Network Error Occurred");
    } on DioError catch (e) {
      e.stackTrace;
      _parseError(e);
    }
  }

  dynamic _parseResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException("Sorry an error occured");
      case 401:

      case 403:
        throw UnauthorisedException("Session Expired");
      case 500:

      default:
        throw FetchDataException(
            'Error occurred while communicating with Server with StatusCode : ${response.statusCode}');
    }
  }

  /*
  * handling various error status codes
  * */
  dynamic _parseError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.response:
        log.d('**********RESPONSE************');
        _parseErrorResponse(dioError);
        break;
      case DioErrorType.connectTimeout:
        log.d('**********CONNECTION***********');
        throw FetchDataException("Connection Timeout");
      case DioErrorType.sendTimeout:
        log.d('**********SEND************');
        throw FetchDataException("Connection Timeout");
      case DioErrorType.receiveTimeout:
        log.d('**********RECEIVE************');
        throw FetchDataException("Connection Timeout");
      case DioErrorType.cancel:
        log.d('**********CANCEL************');
        throw FetchDataException("Request Cancelled");
      case DioErrorType.other:
        log.d('**********OTHERS************');
        throw BadRequestException("An Error Occurred");
      default:
        throw BadRequestException("An Error Occurred");
    }
  }

  /*
  * Handling an error with status code other than 200 and a response data
  * */
  dynamic _parseErrorResponse(DioError dioError) {
    final response = dioError.response;
    switch (response!.statusCode) {
      case 200:
      case 400:
      case 401:
      case 403:
        if (response.data != null) {
          JsonResponse jsonResponse =
          JsonResponse.fromJson(dioError.response!.data!);
          throw FetchDataException(jsonResponse.respDesc);
        } else {
          throw BadRequestException("An Error Occurred");
        }
      case 500:
      default:
        throw FetchDataException("A Server error Occurred");
    }
  }
}