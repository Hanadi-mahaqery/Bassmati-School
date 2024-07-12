import 'package:dio/dio.dart';
import 'package:school_app/models/MonthModel.dart';

class MonthRepository {
  late Dio dio;
  String url = "http://192.168.21.81:5257/api/Month";

  MonthRepository() {
    dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.options.connectTimeout = const Duration(seconds: 60);
  }

  Future<List<MonthModel>> getBySession(int yearId) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.get('$url/month/$yearId');
      if (response.statusCode == 200) {
        var dt = response.data as List;
        List<MonthModel> items = [];
        dt.forEach((e) {
          items.add(MonthModel.fromJson(e));
        });
        return items;
      }
      throw Exception("Response Error ${response.statusMessage}");
    } catch (ex) {
      rethrow;
    }
  }


}
