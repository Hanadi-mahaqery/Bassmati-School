import 'package:dio/dio.dart';
import 'package:school_app/models/LibraryModel.dart';

class LibraryRepository {
  late Dio dio;
  String url = "http://192.168.21.81:5257/api/Library";

  LibraryRepository() {
    dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.options.connectTimeout = const Duration(seconds: 60);
  }

  Future<List<LibraryModel>> getBySession(int subjectId) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.get('$url/subject/$subjectId');
      if (response.statusCode == 200) {
        var dt = response.data as List;
        List<LibraryModel> items = [];
        dt.forEach((e) {
          items.add(LibraryModel.fromJson(e));
        });
        return items;
      }
      throw Exception("Response Error ${response.statusMessage}");
    } catch (ex) {
      rethrow;
    }
  }

  Future<bool> add(LibraryModel obj) async {
    var dt = {
      "content": obj.content,
      "link": obj.link,
      "subjectId": obj.subjectId
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
