class MeetingModel {
  MeetingModel({
    this.meetId,
    this.topics,
    this.meetTime,
    this.meetLink,
    this.decisions,
    this.meetingStatues,
  });

  MeetingModel.fromJson(dynamic json) {
    meetId = json['meetId'];
    topics = json['topics'];
    meetTime = json['meetTime'];
    meetLink = json['meetLink'];
    decisions = json['decisions'];
    meetingStatues = json['meetingStatus'];


  }

  int? meetId;
  String? topics;
  String? meetTime;
  String? meetLink;
  String? decisions;
  bool? meetingStatues;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['meetId'] = meetId;
    map['topics'] = topics;
    map['meetTime'] = meetTime;
    map['meetLink'] = meetLink;
    map['decisions'] = decisions;
    map['meetingStatus'] = meetingStatues;


    return map;
  }
}
