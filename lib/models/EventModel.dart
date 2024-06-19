class EventModel {
  EventModel({
    this.eventId,
    this.eventName,
    this.eventDesc,
    this.eventDate,
    this.eventLocation,
    this.levelId,
  });

  EventModel.fromJson(dynamic json) {
    eventId = json['eventId'];
    eventName = json['eventName'];
    eventDesc = json['eventDesc'];
    eventDate = json['eventDate'];
    eventLocation = json['eventLocation'];
    levelId = json['levelId'];
  }

  int? eventId;
  String? eventName;
  String? eventDesc;
  String? eventDate;
  String? eventLocation;
  int? levelId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['eventId'] = eventId;
    map['eventName'] = eventName;
    map['eventDesc'] = eventDesc;
   // map['eventDate'] = eventDate;
    map['eventLocation'] = eventLocation;
    map['levelId'] = levelId;
    return map;
  }
}
