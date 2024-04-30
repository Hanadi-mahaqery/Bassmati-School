

import 'package:flutter/material.dart';

class StudentModel {
  StudentModel({
    this.stuId,
    this.stuName,
    this.age,
    this.stuEmail,
    this.stuPhoneNo,
    });

  StudentModel.fromJson(dynamic json) {
    stuId = json['stuId'];
    stuName = json['stuName'];
    age = json['age'];
    age = json['stuEmail'];
    stuPhoneNo = json['stuPhoneNo'];

  }
  int? stuId;
  String? stuName;
  String? age;
  String? stuEmail;
  String? stuPhoneNo;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stuId'] = stuId;
    map['stuName'] = stuName;
    map['age'] = age;
    map['stuEmail'] = stuEmail;
    map['stuPhoneNo'] = stuPhoneNo;

    return map;
  }



}