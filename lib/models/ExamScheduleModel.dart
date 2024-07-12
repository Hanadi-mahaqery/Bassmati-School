class ScheduleModel {
  ScheduleModel({
    this.examId,
    this.subjectName,
    this.examTime,
    this.examDate,
    this.examDay,
  });

  ScheduleModel.fromJson(dynamic json) {
    examId = json['examId'];
    subjectName = json['subjectName'];
    examTime = json['examTime'];
    examDate = json['examDate'];
    examDay = json['examDay'];


  }

  int? examId;
  String? subjectName;
  String? examTime;
  String? examDate;
  String? examDay;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['examId'] = examId;
    map['subjectName'] = subjectName;
    map['examTime'] = examTime;
    map['examDate'] = examDate;
    map['examDay'] = examDay;


    return map;
  }
}
