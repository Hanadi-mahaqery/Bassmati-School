import 'package:dio/dio.dart';
import 'package:school_app/models/InComeMeetingModel.dart';

class MeetingRepository {
  late Dio dio;
  String url = "http://192.168.21.81:5257/api/Meetings";

  MeetingRepository() {
    dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.options.connectTimeout = const Duration(seconds: 60);
  }

  Future<List<MeetingModel>> getByStatues(bool meetStatues) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.get('$url/parentMeeting/$meetStatues');
      if (response.statusCode == 200) {
        var dt = response.data as List;
        List<MeetingModel> items = [];
        dt.forEach((e) {
          items.add(MeetingModel.fromJson(e));
        });
        return items;
      }
      throw Exception("Response Error ${response.statusMessage}");
    } catch (ex) {
      rethrow;
    }
  }
}
