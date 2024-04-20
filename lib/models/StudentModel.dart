

import 'package:flutter/material.dart';

class StudentModel {
  StudentModel({
    this.stuId,
    this.stuName,
    this.age
    });

  StudentModel.fromJson(dynamic json) {
    stuId = json['stuId'];
    stuName = json['stuName'];
    age = json['age'];

  }
  int? stuId;
  String? stuName;
  String? age;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stuId'] = stuId;
    map['stuName'] = stuName;
    map['age'] = age;

    return map;
  }



}