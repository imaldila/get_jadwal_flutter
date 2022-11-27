import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_jadwal/app/features/check_in/models/check_in.dart';
import 'package:get_jadwal/app/features/check_in/services/check_in_repository.dart';
import 'package:get_jadwal/utils/services/network/network_dio.dart';

class CheckInService extends CheckInRepository {
  Dio get _dio => NetworkDio.createDio(needAuth: false);
  @override
  Future checkIn({required String email}) async {
    var data = {
      "email": email,
    };
    try {
      Response response = await _dio.post('/checkin', data: data);
      return checkInFromJson(response.data);
    } on DioError catch (e) {
      log(e.toString());
      throw e.message;
    }
  }
}
