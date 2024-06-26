
class ResultsModel {
  ResultsModel({
    this.monthName,
    this.taskDegree,
    this.attendDegree,
    this.disciplineDegree,
    this.examDegree,
    this.oralDegree,
    this.totalResult,
    this.grade,
  });

  ResultsModel.fromJson(dynamic json) {
    monthName = json['monthName'];
    taskDegree = json['taskDegree'] ;
    attendDegree = json['attendDegree'];
    disciplineDegree = json['disciplineDegree'];
    examDegree = json['examDegree'];
    oralDegree = json['oralDegree'];
    totalResult = json['totalResult'];
    grade = json['grade'];
  }

  String? monthName;
  int? taskDegree; // تأكد من أن النوع هو bool
  int? attendDegree;
  int? disciplineDegree;
  int? examDegree;
  int? oralDegree;
  int? totalResult;
  String? grade;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['monthName'] = monthName;
    map['taskDegree'] = taskDegree;
    map['attendDegree'] = attendDegree;
    map['disciplineDegree'] = disciplineDegree;
    map['examDegree'] = examDegree;
    map['oralDegree'] = oralDegree;
    map['totalResult'] = totalResult;
    map['grade'] = grade;
    return map;
  }
}
