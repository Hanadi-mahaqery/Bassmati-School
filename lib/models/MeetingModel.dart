class ExamScheduleModel {
  ExamScheduleModel({
    this.meetId,
    this.topics,
    this.decisions,
    this.meetTime,
    this.meetLink,
  });

  ExamScheduleModel.fromJson(dynamic json) {
    meetId = json['meetId'];
    topics = json['topics'];
    decisions = json['decisions'];
    meetTime = json['meetTime'];
    meetLink = json['meetLink'];


  }

  int? meetId;
  String? topics;
  String? decisions;
  String? meetTime;
  String? meetLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['meetId'] = meetId;
    map['topics'] = topics;
    map['decisions'] = decisions;
    map['meetTime'] = meetTime;
    map['meetLink'] = meetLink;


    return map;
  }
}
