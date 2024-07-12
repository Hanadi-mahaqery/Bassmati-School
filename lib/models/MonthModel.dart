import 'package:flutter/material.dart';

class MonthModel {
  MonthModel({
    this.monthId,
    this.monthName,
    this.yearId,
  });

  MonthModel.fromJson(dynamic json) {
    monthId = json['monthId'];
    monthName = json['monthName'];
    yearId = json['yearId'];
  }

  int? monthId;
  String? monthName;
  int? yearId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['monthId'] = monthId;
    map['monthName'] = monthName;
    map['yearId'] = yearId;
    return map;
  }
}
