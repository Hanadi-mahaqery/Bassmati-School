class SubjectTotalResults{

  final String subjectName;
  final String firstSemester;
  final String secondSemester;
  final String total;


  SubjectTotalResults(this.subjectName, this.firstSemester, this.secondSemester, this.total);
}

List<SubjectTotalResults> result =[
  SubjectTotalResults('Quran','90','89','179',) ,
  SubjectTotalResults('Islamic','70','80','150',) ,
  SubjectTotalResults('Arabic','80','85','165',) ,
  SubjectTotalResults('Maths','60','50','110',) ,
  SubjectTotalResults('English','99','100','199',) ,
  SubjectTotalResults('Science','90','100','190',) ,

];

class TotalGrade{
  final String grade;

  TotalGrade(this.grade);
}
List<TotalGrade> totalGrade =[
  TotalGrade('B')
];