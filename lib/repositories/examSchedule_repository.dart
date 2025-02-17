import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:school_app/models/ExamScheduleModel.dart';

class ExamScheduleRepository {
  late Dio dio;
  String url = "http://192.168.21.81:5257/api/Exam_Schedules";

  ExamScheduleRepository() {
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

  Future<bool> add(ScheduleModel obj) async {
    var dt = {
      "examDate": obj.examDate,
      "examDay": obj.examDay,
      "examTime": obj.examTime,
      "subName": obj.subjectName,
      // "levelId": obj.,
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
