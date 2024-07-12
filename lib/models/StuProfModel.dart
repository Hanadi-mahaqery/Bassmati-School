
class StudentProfModel {
  StudentProfModel({
    this.studentId,
    this.studentName,
    this.studentAge,
    this.stuEmail,
    this.stuPhoneNo,
    this.classId,
    this.stuImage,
    this.levelId,
    this.className,
    this.levelName,
  });

  StudentProfModel.fromJson(dynamic json) {
    studentId = json['studentId'];
    studentName = json['studentName'];
    studentAge = json['studentAge'];
    stuEmail = json['stuEmail'];
    stuPhoneNo = json['stuPhoneNo'];
    stuImage = json['stuImage'];
    classId = json['classId'];
    levelId = json['levelId'];
    className = json['className'];
    levelName = json['levelName'];
  }

  int? studentId;
  String? studentName;
  String? studentAge;
  String? stuEmail;
  String? stuPhoneNo;
  String? stuImage;
  int? classId;
  int? levelId;
  String? className;
  String? levelName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['studentId'] = studentId;
    map['studentName'] = studentName;
    map['studentAge'] = studentAge;
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
