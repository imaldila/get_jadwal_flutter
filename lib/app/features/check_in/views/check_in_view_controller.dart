import 'package:flutter/material.dart';
import 'package:get_jadwal/app/features/check_in/services/check_in_repository.dart';

import '../models/user.dart';
import '../services/check_in_service.dart';

class CheckInViewController {
  final CheckInRepository _checkInRepository = CheckInService();
  bool isFetching = false;

  var _user = User();
  User get user => _user;

  Future<void> postCheckIn({required String email}) async {
    try {
      var data = await _checkInRepository.checkIn(email: email);
      _user = data;
    } catch (e) {
      SnackBar(
        content: Text(
          e.toString(),
        ),
      );
    }
  }

    double opacityColor(String v) {
    return v.isNotEmpty ? 1 : 0.2;
  }
}
