import 'package:flutter/material.dart';
import 'package:school_app/screen/result_screen/subjects_degreeM2/quran_degree.dart';

class ResultData {
  final String subjectName;
  final int totalMarks;
  final int obtainedMark;
  final String grade;
  final String route;
  final  Function onPress;

  ResultData(this.subjectName, this.totalMarks, this.obtainedMark, this.route, this.grade, this.onPress, );
}

List<ResultData> result =[
ResultData('Quran', 100, 90,'QuranDegree', 'A', (BuildContext context){ Navigator.of(context).pushNamed('');}),
ResultData('Arabic', 100, 97,'ArabicDegree', 'A',(BuildContext context){ Navigator.of(context).pushNamed('');}),
ResultData('English', 100, 80,'EnglishDegree', 'B', (BuildContext context){ Navigator.of(context).pushNamed('');}),
ResultData('Science', 100, 88, 'ScienceDegree','A',(BuildContext context){ Navigator.of(context).pushNamed('');}),
ResultData('Math', 100, 50,'MathDegree', 'D',(BuildContext context){ Navigator.of(context).pushNamed('');}),
ResultData('Islamic', 100, 92, 'IslamicDegree','A',(BuildContext context){ Navigator.of(context).pushNamed('');}),


];
List<ResultData> result2 =[
  ResultData('Quran', 100, 90,'QuranDegree2', 'A', (BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('Arabic', 100, 97,'ArabicDegree2', 'A',(BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('English', 100, 80,'EnglishDegree2', 'B', (BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('Science', 100, 88, 'ScienceDegree2','A',(BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('Math', 100, 50,'MathDegree2', 'D',(BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('Islamic', 100, 92, 'IslamicDegree2','A',(BuildContext context){ Navigator.of(context).pushNamed('');}),


];
List<ResultData> result3 =[
  ResultData('Quran', 100, 98,'QuranDegree3', 'A', (BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('Arabic', 100, 90,'ArabicDegree3', 'A',(BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('English', 100, 85,'EnglishDegree3', 'B', (BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('Science', 100, 88, 'ScienceDegree3','A',(BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('Math', 100, 65,'MathDegree3', 'C',(BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('Islamic', 100, 90, 'IslamicDegree3','A',(BuildContext context){ Navigator.of(context).pushNamed('');}),


];
List<ResultData> result4 =[
  ResultData('Quran', 100, 95,'QuranDegree4', 'A', (BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('Arabic', 100, 90,'ArabicDegree4', 'A',(BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('English', 100, 82,'EnglishDegree4', 'B', (BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('Science', 100, 91, 'ScienceDegree4','A',(BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('Math', 100, 70,'MathDegree4', 'C',(BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('Islamic', 100, 94, 'IslamicDegree4','A',(BuildContext context){ Navigator.of(context).pushNamed('');}),


];
List<ResultData> result5 =[
  ResultData('Quran', 100, 89,'QuranDegree5', 'B', (BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('Arabic', 100, 80,'ArabicDegree5', 'B',(BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('English', 100, 80,'EnglishDegree5', 'B', (BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('Science', 100, 70, 'ScienceDegree5','C',(BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('Math', 100, 55,'MathDegree5', 'D',(BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('Islamic', 100, 92, 'IslamicDegree5','A',(BuildContext context){ Navigator.of(context).pushNamed('');}),


];
List<ResultData> result6 =[
  ResultData('Quran', 100, 90,'QuranDegree6', 'A', (BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('Arabic', 100, 97,'ArabicDegree6', 'A',(BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('English', 100, 90,'EnglishDegree6', 'B', (BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('Science', 100, 80, 'ScienceDegree6','A',(BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('Math', 100, 60,'MathDegree6', 'C',(BuildContext context){ Navigator.of(context).pushNamed('');}),
  ResultData('Islamic', 100, 92, 'IslamicDegree6','A',(BuildContext context){ Navigator.of(context).pushNamed('');}),


];