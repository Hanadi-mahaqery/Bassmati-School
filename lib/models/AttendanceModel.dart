class AttendanceModel {
  AttendanceModel({
    this.attendId,
    this.attendDate,
    this.attendStatus,

  });

  AttendanceModel.fromJson(dynamic json) {
    attendId = json['attendId'];
    attendDate = json['attendDate'];
    attendStatus = json['attendStatus'];

  }

  int? attendId;
  String? attendDate;
  bool? attendStatus;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['attendId'] = attendId;
    map['attendDate'] = attendDate;
    map['attendStatus'] = attendStatus;

    return map;


  }
}
