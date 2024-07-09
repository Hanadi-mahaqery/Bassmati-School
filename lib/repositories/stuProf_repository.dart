import 'package:dio/dio.dart';
import 'package:school_app/models/StuProfModel.dart';

class StuProfRepository {
  late Dio dio;
  String url = "http://192.168.21.81:5257/api/StuProfile";

  StuProfRepository() {
    dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.options.connectTimeout = const Duration(seconds: 60);
  }

  Future<List<StudentProfModel>> getByStudent(int stuId) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.get("$url?stuId=$stuId");
      if (response.statusCode == 200) {
        var dt = response.data as List;
        List<StudentProfModel> items = [];
        dt.forEach((e) {
          items.add(StudentProfModel.fromJson(e));
        });
        return items;
      }
      throw Exception("Response Error ${response.statusMessage}");
    } catch (ex) {
      rethrow;
    }
  }
}
