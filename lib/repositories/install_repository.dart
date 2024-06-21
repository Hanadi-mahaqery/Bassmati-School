import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:school_app/models/InstallModel.dart';

class InstallmentRepository {
  late Dio dio;
  String url = "http://192.168.219.81:5257/api/Installment";

  InstallmentRepository() {
    dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.options.connectTimeout = const Duration(seconds: 60);
  }

  Future<List<InstallModel>> getAll() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        var dt = response.data as List;
        List<InstallModel> items = dt.map((e) => InstallModel.fromJson(e)).toList();
        return items;
      }
      throw Exception("Response Error ${response.statusMessage}");
    } catch (ex) {
      log("Error in getAll: $ex");
      rethrow;
    }
  }

  Future<bool> add(InstallModel obj) async {
    var dt = {
      "installNo": obj.installNo,
      "installDate": obj.installDate,
      "installStatus": obj.installStatus,
      "amountDue": obj.amountDue,
      "amountPaid": obj.amountPaid,
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
