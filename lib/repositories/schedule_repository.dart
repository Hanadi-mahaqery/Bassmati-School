import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:school_app/models/ScheduleModel.dart';

class ScheduleRepository {
  late Dio dio;
  String url = "http://192.168.219.81:5257/api/Schedule";

  ScheduleRepository() {
    dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.options.connectTimeout = const Duration(seconds: 60);
  }

  Future<List<ScheduleModel>> getAll() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        var dt = response.data as List;
        List<ScheduleModel> items = dt.map((e) => ScheduleModel.fromJson(e)).toList();
        return items;
      }
      throw Exception("Response Error ${response.statusMessage}");
    } catch (ex) {
      log("Error in getAll: $ex");
      rethrow;
    }
  }


}
