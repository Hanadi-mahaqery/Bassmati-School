

import 'package:flutter/material.dart';

class LibraryModel {
  LibraryModel({
    this.libId,
    this.content,
    this.link,});

  LibraryModel.fromJson(dynamic json) {
    libId = json['libId'];
    content = json['content'];
    link = json['link'];
  }
  int? libId;
  String? content;
  String? link;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['libId'] = libId;
    map['content'] = content;
    map['link'] = link;
    return map;
  }



}