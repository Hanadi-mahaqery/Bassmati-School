import 'package:dio/dio.dart';
import 'package:school_app/models/PdfModel.dart';

class PdfRepository {
  late Dio dio;
  String url = "http://192.168.21.81:5257/api/Pdf";

  PdfRepository() {
    dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.options.connectTimeout = const Duration(seconds: 60);
  }

  Future<List<StuProfModel>> getBySubject(int subjectId) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.get("$url?subId=$subjectId");
      if (response.statusCode == 200) {
        var dt = response.data as List;
        List<StuProfModel> items = [];
        dt.forEach((e) {
          items.add(StuProfModel.fromJson(e));
        });
        return items;
      }
      throw Exception("Response Error ${response.statusMessage}");
    } catch (ex) {
      rethrow;
    }
  }
}
