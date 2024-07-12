import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:school_app/models/ResultsModel.dart';

class ResultsRepository {
  late Dio dio;
  String url = "http://192.168.21.81:5257/api/Results";

  ResultsRepository() {
    dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.options.connectTimeout = const Duration(seconds: 60);
  }

  Future<List<ResultsModel>> getByMonth(int monthId) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.get('$url/degree/$monthId');
      if (response.statusCode == 200) {
        var data = response.data;
        if (data is List) {
          return data.map((item) => ResultsModel.fromJson(item)).toList();
        } else if (data is Map<String, dynamic>) {
          return [ResultsModel.fromJson(data)];
        } else {
          throw Exception("Unexpected data type: ${data.runtimeType}");
        }
      }
      throw Exception("Response Error ${response.statusMessage}");
    } catch (ex) {
      rethrow;
    }
  }
}