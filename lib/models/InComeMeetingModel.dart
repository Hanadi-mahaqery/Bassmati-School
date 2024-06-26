class MeetingModel {
  MeetingModel({
    this.meetId,
    this.topics,
    this.meetTime,
    this.meetLink,
    this.decisions,
    this.meetStatues,
  });

  MeetingModel.fromJson(dynamic json) {
    meetId = json['meetId'];
    topics = json['topics'];
    meetTime = json['meetTime'];
    meetLink = json['meetLink'];
    decisions = json['decisions'];
    meetStatues = json['meetStatues'];


  }

  int? meetId;
  String? topics;
  String? meetTime;
  String? meetLink;
  String? decisions;
  int? meetStatues;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['meetId'] = meetId;
    map['topics'] = topics;
    map['meetTime'] = meetTime;
    map['meetLink'] = meetLink;
    map['decisions'] = decisions;
    map['meetStatues'] = meetStatues;


    return map;
  }
}
