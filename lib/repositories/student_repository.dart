import 'package:dio/dio.dart';
import 'package:school_app/Data/DbHelper.dart';
import 'package:school_app/models/StudentModel.dart';

class StudentRepository{
  late Dio dio;
  String url ="http://192.168.1.10:5281/api/numbers";
  StudentRepository(){
    dio = Dio();
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout= const Duration(seconds: 60);
    dio.options.connectTimeout= const Duration(seconds: 60);


  }
  Future<List<StudentModel>> getAll()async{
    try{
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.get(url);
      if (response.statusCode == 200){
        var dt = response.data as List;
        List<StudentModel> items =[];
        dt.forEach((e) {
          items.add(StudentModel.fromJson(e));
        });

        return items;
      }
     throw Exception("Response Error ${response.statusMessage}");
    }
    catch(ex){
      rethrow;
    }
  }

  Future<bool> add(StudentModel obj)async{
    var dt={
      "name": obj.name,
      "age": obj.age
    };
    try{
      await Future.delayed(Duration(seconds: 1));
      var response = await dio.post(url,data: dt);
      if (response.statusCode == 200){
        var res = response.data as bool;
        return res;
      }
      throw Exception("Response Error ${response.statusMessage}");
    }
    catch(ex){
      rethrow;
    }
  }


}