class EventModel {
  EventModel({
    this.eventId,
    this.eventName,
    this.eventDesc,
    this.eventDate,
    this.eventLocation,

  });

  EventModel.fromJson(dynamic json) {
    eventId = json['eventId'];
    eventName = json['eventName'];
    eventDesc = json['eventDesc'];
    eventDate = json['eventDate'];
    eventLocation = json['eventLocation'];
  }

  int? eventId;
  String? eventName;
  String? eventDesc;
  String? eventDate;
  String? eventLocation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['eventId'] = eventId;
    map['eventName'] = eventName;
    map['eventDesc'] = eventDesc;
   // map['eventDate'] = eventDate;
    map['eventLocation'] = eventLocation;
    return map;
  }
}
