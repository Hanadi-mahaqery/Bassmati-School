

class TaskHWModel {
  TaskHWModel({
    this.hwId,
    this.hwName,
    this.hwContent,
    this.assignDate,
    this.lastDate,
    this.subId,

  });

  TaskHWModel.fromJson(dynamic json) {
    hwId   = json['hwId'];
    hwName = json['hwName'];
    hwContent = json['hwContent'] ;
    assignDate = json['assignDate'];
    lastDate = json['lastDate'];
    subId = json['subId'];

  }
  int? hwId;
  String? hwName;
  String? hwContent;
  String? assignDate;
  String? lastDate;
  int? subId;



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hwId'] = hwId;
    map['hwName'] = hwName;
    map['hwContent'] = hwContent;
    map['assignDate'] = assignDate;
    map['lastDate'] = lastDate;
    map['subId'] = subId;

    return map;
  }
}
