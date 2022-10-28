import 'dart:convert';

import 'package:escrow/data/models/JsonResponse.dart';
import 'package:escrow/network/api_constants.dart';
import 'package:escrow/network/dio_client.dart';
import 'package:escrow/network/network_exceptions.dart';
import 'package:escrow/shared/utils/logger.dart';

class AuthRepository {
  var log = getLogger('AuthRepository');
  final DioClient _dioClient = DioClient();

  Future<void> validateOTP(Map payload) async {
    try {
      final request =
      await _dioClient.post(ApiConstants.kValidateOTP, data: payload);
      final JsonResponse jsonResponse =
      JsonResponse.fromJson(jsonDecode(request.data));

      if (jsonResponse.respCode != "111") {
        throw FetchDataException(jsonResponse.respDesc);
      }
    } on Exception catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }
}