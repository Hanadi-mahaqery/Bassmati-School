class ExamSchedule {
  final int date;
  final String monthName;
  final String subjectName;
  final String dayName;
  final String time;

  ExamSchedule(this.date, this.monthName, this.subjectName, this.dayName, this.time);
}
List<ExamSchedule> examSchedule =[

  ExamSchedule(11,'JAN','Math','Monday','9:00 am'),
  ExamSchedule(12,'JAN','Science','Tuesday','10:00 am'),
  ExamSchedule(13,'JAN','Quran','Monday','9:30 am'),
  ExamSchedule(14,'JAN','Arabic','Monday','11:00 am'),
  ExamSchedule(15,'JAN','English','Monday','10:00 am'),
  ExamSchedule(16,'JAN','Islamic','Monday','9:00 am'),

];
