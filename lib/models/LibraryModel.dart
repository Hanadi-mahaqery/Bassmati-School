import 'package:flutter/material.dart';

class LibraryModel {
  LibraryModel({
    this.libId,
    this.content,
    this.link,
    this.subjectId, // إضافة subjectId
  });

  LibraryModel.fromJson(dynamic json) {
    libId = json['libId'];
    content = json['content'];
    link = json['link'];
    subjectId = json['subject_id']; // تعيين subjectId
  }

  int? libId;
  String? content;
  String? link;
  int? subjectId; // إضافة subjectId

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['libId'] = libId;
    map['content'] = content;
    map['link'] = link;
    map['subject_id'] = subjectId; // إضافة subjectId
    return map;
  }
}
