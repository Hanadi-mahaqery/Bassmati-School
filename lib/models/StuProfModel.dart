import 'package:flutter/material.dart';

class StudentProfModel {
  StudentProfModel({
    this.stuId,
    this.stuName,
    this.age,
    this.stuEmail,
    this.stuPhoneNo,
    this.stuImage,
  });

  StudentProfModel.fromJson(dynamic json) {
    stuId = json['stuId'];
    stuName = json['stuName'];
    age = json['age'];
    stuEmail= json['stuEmail'];
    stuPhoneNo = json['stuPhoneNo'];
    stuImage = json['stuImage'];
  }

  int? stuId;
  String? stuName;
  String? age;
  String? stuEmail;
  String? stuPhoneNo;
  String? stuImage; // Assuming the image is stored as a Base64 encoded string

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stuId'] = stuId;
    map['stuName'] = stuName;
    map['age'] = age;
    map['stuEmail'] = stuEmail;
    map['stuPhoneNo'] = stuPhoneNo;
    map['stuImage'] = stuImage;

    return map;
  }
}
