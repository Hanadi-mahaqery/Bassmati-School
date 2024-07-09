import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:school_app/models/EventModel.dart';

class EventRepository {
  late Dio dio;
  String url = "http://192.168.21.81:5257/api/Events";

  EventRepository() {
    dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.options.connectTimeout = const Duration(seconds: 60);
  }

  Future<List<EventModel>> getAll() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        var dt = response.data as List;
        List<EventModel> items = dt.map((e) => EventModel.fromJson(e)).toList();
        return items;
      }
      throw Exception("Response Error ${response.statusMessage}");
    } catch (ex) {
      log("Error in getAll: $ex");
      rethrow;
    }
  }

  Future<bool> add(EventModel obj) async {
    var dt = {
      "eventName": obj.eventName,
      "eventDesc": obj.eventDesc,
      "eventDate": obj.eventDate,
      "eventLocation": obj.eventLocation,
      "levelId": obj.levelId,
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
