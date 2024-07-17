


class StudentModel {
  StudentModel({
    this.stuId,
    this.stuName,
    this.age,
    this.stuEmail,
    this.stuPhoneNo,
    this.stuImage,
    this.classId,
    this.className,
    this.parentId,
    this.parentName,



  });

  StudentModel.fromJson(dynamic json) {
    stuId = json['stuId'];
    stuName = json['studentName'];
    age = json['age'];
    stuEmail= json['stuEmail'];
    stuPhoneNo = json['stuPhoneNo'];
    stuImage = json['stuImage'];
    classId = json['classId'];
    className = json['className'];
    parentId = json['parentId'];
    parentName = json['parentName'];



  }
  int? stuId;
  String? stuName;
  String? age;
  String? stuEmail;
  String? stuPhoneNo;
  String? stuImage;
  String? className;
  int? classId;
  String? parentName;
  int? parentId;



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stuId'] = stuId;
    map['studentName'] = stuName;
    map['age'] = age;
    map['stuEmail'] = stuEmail;
    map['stuPhoneNo'] = stuPhoneNo;
    map['stuImage'] = stuImage;
    map['classId'] = classId;
    map['className'] = className;
    map['parentId'] = parentId;
    map['parentName'] = parentName;


    return map;
  }



}