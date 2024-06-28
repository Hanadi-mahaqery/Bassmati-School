
class StudentProfModel {
  StudentProfModel({
    this.stuId,
    this.stuName,
    this.age,
    this.stuEmail,
    this.stuPhoneNo,
    this.classId,
    this.stuImage,
    this.levelId,
    this.className,
    this.levelName,
  });

  StudentProfModel.fromJson(dynamic json) {
    stuId = json['stuId'];
    stuName = json['stuName'];
    age = json['age'];
    stuEmail = json['stuEmail'];
    stuPhoneNo = json['stuPhoneNo'];
    stuImage = json['stuImage'];
    classId = json['classId'];
    levelId = json['levelId'];
    className = json['className'];
    levelName = json['levelName'];
  }

  int? stuId;
  String? stuName;
  String? age;
  String? stuEmail;
  String? stuPhoneNo;
  String? stuImage;
  int? classId;
  int? levelId;
  String? className;
  String? levelName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stuId'] = stuId;
    map['stuName'] = stuName;
    map['age'] = age;
    map['stuEmail'] = stuEmail;
    map['stuPhoneNo'] = stuPhoneNo;
    map['stuImage'] = stuImage;
    map['classId'] = classId;
    map['levelId'] = levelId;
    map['className'] = className;
    map['levelName'] = levelName;
    return map;
  }
}
