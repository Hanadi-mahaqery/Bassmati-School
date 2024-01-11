class AssignmentData{
   final String subjectName;
   final String topicName;
   final String assignData;
   final String lastData;
   final String status;

  AssignmentData(this.subjectName, this.topicName, this.assignData, this.lastData, this.status);
}

List<AssignmentData> assignment =[
  AssignmentData('Biology','Red Blood cells','17 Nov 2023','20 Nov 2023','Pending') ,
  AssignmentData('Maths','Jabr','16 Nov 2023','18 Nov 2023','Pending') ,
  AssignmentData('Arabic','Dictation','21 Nov 2023','22 Nov 2023','submitted') ,
  AssignmentData('Quran','Tafseer','15 Nov 2023','16 Nov 2023','Pending') ,
  AssignmentData('Chemistry','Organic chemistry','17 Nov 2023','20 Nov 2023','submitted') ,
];