
class ResultsModel {
  ResultsModel({
    this.degreeId,
    this.monthName,
    this.taskDegree,
    this.attendDegree,
    this.disciplineDegree,
    this.examDegree,
    this.oralDegree,
    this.totalMonth,
    this.subId,

  });

  ResultsModel.fromJson(dynamic json) {
    degreeId = json['degreeId'];
    monthName = json['monthName'];
    taskDegree = json['taskDegree'] ;
    attendDegree = json['attendDegree'];
    disciplineDegree = json['disciplineDegree'];
    examDegree = json['examDegree'];
    oralDegree = json['oralDegree'];
    totalMonth = json['totalMonth'];
    subId = json['subId'];
  }
  int? degreeId;
  String? monthName;
  int? taskDegree; // تأكد من أن النوع هو bool
  int? attendDegree;
  int? disciplineDegree;
  int? examDegree;
  int? oralDegree;
  int? totalMonth;
  int? subId;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['degreeId'] = degreeId;
    map['monthName'] = monthName;
    map['taskDegree'] = taskDegree;
    map['attendDegree'] = attendDegree;
    map['disciplineDegree'] = disciplineDegree;
    map['examDegree'] = examDegree;
    map['oralDegree'] = oralDegree;
    map['totalMonth'] = totalMonth;
    map['subId'] = subId;
    return map;
  }
}
