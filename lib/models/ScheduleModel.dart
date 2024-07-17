class ScheduleModel {
  ScheduleModel({
    this.scheduleId,
    this.day,
    this.firstPeriod,
    this.seconedPeriod,
    this.thirdPeriod,
    this.forthPeriod,
    this.fifthPeriod,
    this.sixthPeriod,
    this.seventhPeriod,
    this.classId,
  });

  ScheduleModel.fromJson(dynamic json) {
    scheduleId = json['scheduleId'];
    day = json['day'];
    firstPeriod = json['firstPeriod'];
    seconedPeriod = json['secondPeriod'];
    thirdPeriod = json['thirdPeriod'];
    forthPeriod = json['fourthPeriod'];
    fifthPeriod = json['fifthPeriod'];
    sixthPeriod = json['sixthPeriod'];
    seventhPeriod = json['seventhPeriod'];
    classId = json['classId'];


  }

  int? scheduleId;
  String? day;
  String? firstPeriod;
  String? seconedPeriod;
  String? thirdPeriod;
  String? forthPeriod;
  String? fifthPeriod;
  String? sixthPeriod;
  String? seventhPeriod;
  int? classId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['scheduleId'] = scheduleId;
    map['day'] = day;
    map['firstPeriod'] = firstPeriod;
    map['secondPeriod'] = seconedPeriod;
    map['thirdPeriod'] = thirdPeriod;
    map['fourthPeriod'] = forthPeriod;
    map['fifthPeriod'] = fifthPeriod;
    map['sixthPeriod'] = sixthPeriod;
    map['seventhPeriod'] = seventhPeriod;
    map['classId'] = classId;


    return map;
  }
}
