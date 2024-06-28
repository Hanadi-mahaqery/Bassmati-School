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
    this.classId,
  });

  ScheduleModel.fromJson(dynamic json) {
    scheduleId = json['scheduleId'];
    day = json['day'];
    firstPeriod = json['firstPeriod'];
    seconedPeriod = json['seconedPeriod'];
    thirdPeriod = json['thirdPeriod'];
    forthPeriod = json['forthPeriod'];
    fifthPeriod = json['fifthPeriod'];
    sixthPeriod = json['sixthPeriod'];
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
  int? classId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['scheduleId'] = scheduleId;
    map['day'] = day;
    map['firstPeriod'] = firstPeriod;
    map['seconedPeriod'] = seconedPeriod;
    map['thirdPeriod'] = thirdPeriod;
    map['forthPeriod'] = forthPeriod;
    map['fifthPeriod'] = fifthPeriod;
    map['sixthPeriod'] = sixthPeriod;
    map['classId'] = classId;


    return map;
  }
}
