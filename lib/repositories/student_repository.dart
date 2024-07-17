import 'package:dio/dio.dart';
import 'package:school_app/models/StudentModel.dart';
import 'dart:developer'; // لإضافة مسجلات للأخطاء

class StudentRepository {
  late Dio dio;
  String url = "http://192.168.21.81:5257/api/Student";

  StudentRepository() {
    dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.options.connectTimeout = const Duration(seconds: 60);
  }
  Future<List<StudentModel>> getByStudent(int stuId) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.get("$url?studentId=$stuId");
      if (response.statusCode == 200) {
        var dt = response.data as List;
        List<StudentModel> items = [];
        dt.forEach((e) {
          items.add(StudentModel.fromJson(e));
        });
        return items;
      }
      throw Exception("Response Error ${response.statusMessage}");
    } catch (ex) {
      rethrow;
    }
  }
  // Future<List<StudentModel>> getAll() async {
  //   try {
  //     await Future.delayed(Duration(seconds: 1));
  //     var response = await dio.get(url);
  //     if (response.statusCode == 200) {
  //       var dt = response.data as List;
  //       List<StudentModel> items =
  //           dt.map((e) => StudentModel.fromJson(e)).toList();
  //       return items;
  //     }
  //     throw Exception("Response Error ${response.statusMessage}");
  //   } catch (ex) {
  //     log("Error in getAll: $ex");
  //     rethrow;
  //   }
  // }

  Future<bool> add(StudentModel obj) async {
    var dt = {
      "stuName": obj.stuName,
      "age": obj.age,
      "stuEmail": obj.stuEmail,
      "stuPhoneNo": obj.stuPhoneNo
    };
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.post(url, data: dt);
      if (response.statusCode == 200) {
        return response.data as bool;
      }
      throw Exception("Response Error ${response.statusMessage}");
    } catch (ex) {
      log("Error in add: $ex");
      rethrow;
    }
  }

  Future<bool> update(StudentModel obj) async {
    var dt = {
      "stuId": obj.stuId,
      "stuName": obj.stuName,
      "age": obj.age,
      "stuEmail": obj.stuEmail,
      "stuPhoneNo": obj.stuPhoneNo
    };
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.put(url + "/${obj.stuId}", data: dt);
      if (response.statusCode == 200 || response.statusCode == 204) {
        return true;
      }
      throw Exception("Response Error ${response.statusMessage}");
    } catch (ex) {
      log("Error in update: $ex");
      rethrow;
    }
  }

  Future<bool> delete(int studentId) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.delete(url + "/$studentId");
      if (response.statusCode == 200) {
        return response.data as bool;
      }
      throw Exception("Response Error ${response.statusMessage}");
    } catch (ex) {
      log("Error in delete: $ex");
      rethrow;
    }
  }
}
