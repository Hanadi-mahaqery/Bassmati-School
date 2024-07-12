
class ResultsModel {
  ResultsModel({
    this.degreeId,
    this.subjectName,
    this.task,
    this.attend,
    this.discipline,
    this.exam,
    this.oral,
    this.totalMonth,
    this.subId,

  });

  ResultsModel.fromJson(dynamic json) {
    degreeId = json['degreeId'];
    monthId = json['monthId'];
    subjectName = json['subjectName'];
    task = json['task'] ;
    attend = json['attend'];
    discipline = json['discipline'];
    exam = json['exam'];
    oral = json['oral'];
    totalMonth = json['totalMonth'];
    subId = json['subId'];
  }
  int? degreeId;
  int? monthId;
  String? subjectName;
  int? task; // تأكد من أن النوع هو bool
  int? attend;
  int? discipline;
  int? exam;
  int? oral;
  int? totalMonth;
  int? subId;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['degreeId'] = degreeId;
    map['monthId'] = monthId;
    map['subjectName'] = subjectName;
    map['task'] = task;
    map['attend'] = attend;
    map['discipline'] = discipline;
    map['exam'] = exam;
    map['oral'] = oral;
    map['totalMonth'] = totalMonth;
    map['subId'] = subId;
    return map;
  }
}
