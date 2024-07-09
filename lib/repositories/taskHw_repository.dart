import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:school_app/models/TaskHwModel.dart';

class TaskHwRepository {
  late Dio dio;
  String url = "http://192.168.21.81:5257/api/Tasks_HW";

  TaskHwRepository() {
    dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.options.connectTimeout = const Duration(seconds: 60);
  }

  Future<List<TaskHWModel>> getAll() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        var dt = response.data as List;
        List<TaskHWModel> items = dt.map((e) => TaskHWModel.fromJson(e)).toList();
        return items;
      }
      throw Exception("Response Error ${response.statusMessage}");
    } catch (ex) {
      log("Error in getAll: $ex");
      rethrow;
    }
  }


}
