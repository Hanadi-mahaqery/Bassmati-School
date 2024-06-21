class InstallModel {
  InstallModel({
    this.examId,
    this.subName,
    this.examTime,
    this.examDate,
    this.examDay,
  });

  InstallModel.fromJson(dynamic json) {
    examId = json['examId'];
    subName = json['subName'];
    examTime = json['examTime'];
    examDate = json['examDate'];
    examDay = json['examDay'];


  }

  int? examId;
  String? subName;
  String? examTime;
  String? examDate;
  String? examDay;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['examId'] = examId;
    map['subName'] = subName;
    map['examTime'] = examTime;
    map['examDate'] = examDate;
    map['examDay'] = examDay;


    return map;
  }
}
