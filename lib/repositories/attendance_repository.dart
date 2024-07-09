import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:school_app/models/AttendanceModel.dart';

class AttendanceRepository {
  late Dio dio;
  String url = "http://192.168.21.81:5257/api/Attendance";

  AttendanceRepository() {
    dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.options.connectTimeout = const Duration(seconds: 60);
  }

  Future<List<AttendanceModel>> getAll() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        var dt = response.data as List;
        List<AttendanceModel> items = dt.map((e) => AttendanceModel.fromJson(e)).toList();
        return items;
      }
      throw Exception("Response Error ${response.statusMessage}");
    } catch (ex) {
      log("Error in getAll: $ex");
      rethrow;
    }
  }

  Future<bool> add(AttendanceModel obj) async {
    var dt = {
      "attendDate": obj.attendDate,
      "attendStatus": obj.attendStatus,

    };
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.post(url, data: dt);
      if (response.statusCode == 200) {
        var res = response.data as bool;
        return res;
      }
      throw Exception("Response Error ${response.statusMessage}");
    } catch (ex) {
      rethrow;
    }
  }
}
