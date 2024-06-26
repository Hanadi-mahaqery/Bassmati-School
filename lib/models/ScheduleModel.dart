class ScheduleModel {
  ScheduleModel({
    this.scheduleId,
    this.day,
    this.periodName,
    this.subName,
  });

  ScheduleModel.fromJson(dynamic json) {
    scheduleId = json['scheduleId'];
    day = json['day'];
    periodName = json['periodName'];
    subName = json['subName'];


  }

  int? scheduleId;
  String? day;
  String? periodName;
  String? subName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['scheduleId'] = scheduleId;
    map['day'] = day;
    map['periodName'] = periodName;
    map['subName'] = subName;


    return map;
  }
}
