/// id : 7
/// Name : "hanadi"
/// Age : 24

class StudentModel {
  StudentModel({
      num id, 
      String name, 
      num age,}){
    _id = id;
    _name = name;
    _age = age;
}

  StudentModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['Name'];
    _age = json['Age'];
  }
  num _id;
  String _name;
  num _age;
StudentModel copyWith({  num id,
  String name,
  num age,
}) => StudentModel(  id: id ?? _id,
  name: name ?? _name,
  age: age ?? _age,
);
  num get id => _id;
  String get name => _name;
  num get age => _age;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['Name'] = _name;
    map['Age'] = _age;
    return map;
  }

}