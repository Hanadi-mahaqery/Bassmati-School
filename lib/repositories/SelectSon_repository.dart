import 'package:dio/dio.dart';
import 'package:school_app/models/StudentModel.dart';
import 'dart:developer'; // لإضافة مسجلات للأخطاء

class SelectsonRepository {
  late Dio dio;
  String url = "http://192.168.21.81:5257/api/SelectSon";

  SelectsonRepository() {
    dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.options.connectTimeout = const Duration(seconds: 60);
  }
  Future<List<StudentModel>> getByParentId(int parentId) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.get("$url/parent/$parentId");
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
}