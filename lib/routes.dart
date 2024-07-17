import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:school_app/EditStudentPage.dart';
import 'package:school_app/models/StudentModel.dart';
import 'package:school_app/screen/Meetings/Meeting_type.dart';
import 'package:school_app/screen/Meetings/PreMeetingScreen.dart';
import 'package:school_app/screen/Meetings/inCome_meetings_screen.dart';
import 'package:school_app/screen/ParentHomeScreen/ParentHomeScreen.dart';
import 'package:school_app/screen/all_sign/all_sign.dart';
import 'package:school_app/screen/assignment_screen/assignment_screen.dart';
import 'package:school_app/screen/attendence_screen/attendence_screen.dart';
import 'package:school_app/screen/event_screen/event_screen.dart';
import 'package:school_app/screen/exam_schedule/exam_schedule.dart';
import 'package:school_app/screen/fee_screen/fee_screen.dart';
import 'package:school_app/screen/library_screen/first_session/books/books_first_session.dart';
import 'package:school_app/screen/library_screen/first_session/books/pdfs/Arabic_pdf.dart';
import 'package:school_app/screen/library_screen/first_session/books/pdfs/English_pdf.dart';
import 'package:school_app/screen/library_screen/first_session/books/pdfs/Islamic_pdf.dart';
import 'package:school_app/screen/library_screen/first_session/books/pdfs/Math_pdf.dart';
import 'package:school_app/screen/library_screen/first_session/books/pdfs/Quran_pdf.dart';
import 'package:school_app/screen/library_screen/first_session/books/pdfs/Science_pdf.dart';
import 'package:school_app/screen/library_screen/first_session/videos/content/Arabic.dart';
import 'package:school_app/screen/library_screen/first_session/videos/content/English.dart';
import 'package:school_app/screen/library_screen/first_session/videos/content/Islamic.dart';
import 'package:school_app/screen/library_screen/first_session/videos/content/Math.dart';
import 'package:school_app/screen/library_screen/first_session/videos/content/Quran.dart';
import 'package:school_app/screen/library_screen/first_session/videos/content/Science.dart';
import 'package:school_app/screen/library_screen/first_session/videos/data/Islamic_content_data.dart';
import 'package:school_app/screen/library_screen/first_session/videos/videos_first_session.dart';
import 'package:school_app/screen/library_screen/library_screen.dart';
import 'package:school_app/screen/library_screen/first_session/library_type.dart';
import 'package:school_app/screen/library_screen/second_session/books/books_second_session.dart';
import 'package:school_app/screen/library_screen/second_session/library_type2.dart';
import 'package:school_app/screen/library_screen/second_session/second_session.dart';
import 'package:school_app/screen/library_screen/lib_sessions_screen.dart';
import 'package:school_app/screen/library_screen/second_session/videos/content/Arabic2.dart';
import 'package:school_app/screen/library_screen/second_session/videos/content/English2.dart';
import 'package:school_app/screen/library_screen/second_session/videos/content/Islamic2.dart';
import 'package:school_app/screen/library_screen/second_session/videos/content/Math2.dart';
import 'package:school_app/screen/library_screen/second_session/videos/content/Quran2.dart';
import 'package:school_app/screen/library_screen/second_session/videos/content/Science2.dart';
import 'package:school_app/screen/login_screen/forget_password.dart';
import 'package:school_app/screen/notification_screen/notification_screen.dart';
import 'package:school_app/screen/parent_login/Select_Son.dart';
import 'package:school_app/screen/parent_login/parent_log.dart';
import 'package:school_app/screen/result_screen/session1/month1/arabic_degree.dart';
import 'package:school_app/screen/result_screen/session1/month1/english_degree.dart';
import 'package:school_app/screen/result_screen/session1/month1/islamic_degree.dart';
import 'package:school_app/screen/result_screen/session1/month1/math_degree.dart';
import 'package:school_app/screen/result_screen/session1/month1/quran_degree.dart';
import 'package:school_app/screen/result_screen/session1/month1/sciense_data.dart';
import 'package:school_app/screen/result_screen/session1/month3/arabic_degree.dart';
import 'package:school_app/screen/result_screen/session1/month3/english_degree.dart';
import 'package:school_app/screen/result_screen/session1/month3/islamic_degree.dart';
import 'package:school_app/screen/result_screen/session1/month3/math_degree.dart';
import 'package:school_app/screen/result_screen/session1/month3/quran_degree.dart';
import 'package:school_app/screen/result_screen/session1/month3/sciense_degree.dart';
import 'package:school_app/screen/result_screen/session2/month1nd/arabic_degree.dart';
import 'package:school_app/screen/result_screen/session2/month1nd/english_degree.dart';
import 'package:school_app/screen/result_screen/session2/month1nd/islamic_degree.dart';
import 'package:school_app/screen/result_screen/session2/month1nd/math_degree.dart';
import 'package:school_app/screen/result_screen/session2/month1nd/quran_degree.dart';
import 'package:school_app/screen/result_screen/session2/month1nd/sciense_degree.dart';
import 'package:school_app/screen/result_screen/session2/month2nd/arabic_degree.dart';
import 'package:school_app/screen/result_screen/session2/month2nd/english_degree.dart';
import 'package:school_app/screen/result_screen/session2/month2nd/islamic_degree.dart';
import 'package:school_app/screen/result_screen/session2/month2nd/math_degree.dart';
import 'package:school_app/screen/result_screen/session2/month2nd/quran_degree.dart';
import 'package:school_app/screen/result_screen/session2/month2nd/sciense_degree.dart';
import 'package:school_app/screen/result_screen/session2/month3nd/arabic_degree.dart';
import 'package:school_app/screen/result_screen/session2/month3nd/english_degree.dart';
import 'package:school_app/screen/result_screen/session2/month3nd/islamic_degree.dart';
import 'package:school_app/screen/result_screen/session2/month3nd/math_degree.dart';
import 'package:school_app/screen/result_screen/session2/month3nd/quran_degree.dart';
import 'package:school_app/screen/result_screen/session2/month3nd/sciense_degree.dart';
import 'package:school_app/screen/result_screen/subjects_degreeM2/arabic_degree.dart';
import 'package:school_app/screen/result_screen/subjects_degreeM2/english_degree.dart';
import 'package:school_app/screen/result_screen/subjects_degreeM2/islamic_degree.dart';
import 'package:school_app/screen/result_screen/subjects_degreeM2/math_degree.dart';
import 'package:school_app/screen/result_screen/subjects_degreeM2/quran_degree.dart';
import 'package:school_app/screen/result_screen/session2/months2_screen.dart';
import 'package:school_app/screen/result_screen/session1/months_result.dart';
import 'package:school_app/screen/result_screen/session1/months/result2_screen.dart';
import 'package:school_app/screen/result_screen/session1/months/result3_screen.dart';
import 'package:school_app/screen/result_screen/session1/months/result_screen.dart';
import 'package:school_app/screen/result_screen/session2/moths2/result_nd_1.dart';
import 'package:school_app/screen/result_screen/session2/moths2/result_nd_2.dart';
import 'package:school_app/screen/result_screen/session2/moths2/result_nd_3.dart';
import 'package:school_app/screen/result_screen/sessions_screen/session_screen.dart';
import 'package:school_app/screen/result_screen/subjects_degreeM2/science_degree.dart';
import 'package:school_app/screen/result_screen/total_screen/total%20screen.dart';
import 'package:school_app/screen/result_screen/total_screen/total1_screen.dart';
import 'package:school_app/screen/result_screen/total_screen/total2_screen.dart';
import 'package:school_app/screen/schedule_screen/schedule_screen.dart';
import 'package:school_app/screen/splash_screen/splash_screen.dart';
import 'package:school_app/screen/login_screen/login_screen.dart';
import 'package:school_app/screen/home_screen/home_screen.dart';
import 'package:school_app/screen/student_profile/student_profile.dart';
import 'package:school_app/student.dart';




Map<String, WidgetBuilder> routes ={
  //all screens registered here
  SplashScreen.routeName :(context)=> SplashScreen(),
  LoginScreen.routeName:(context)=>LoginScreen(),
  HomeScreen.routeName:(context)=>HomeScreen(),
  StudentProfile.routeName:(context)=>StudentProfile(),
  FeeScreen.routName:(context)=>FeeScreen(),
  AllSign.routName:(context)=>AllSign(),
  ParentLogin.routeName:(context)=>ParentLogin(),
  ResultScreen.routeName:(context)=>ResultScreen(),
  AssignmentScreen.routeName:(context)=>AssignmentScreen(),
  ExamScreen.routeName:(context)=>ExamScreen(),
  MonthsResults.routeName:(context)=>MonthsResults(),
  SessionScreen.routeName:(context)=>SessionScreen(),
  Months2Results.routeName:(context)=>Months2Results(),
  Result2Screen.routeName:(context)=>Result2Screen(),
  Result3Screen.routeName:(context)=>Result3Screen(),
  ResultNd1Screen.routeName:(context)=>ResultNd1Screen(),
  ResultNd2Screen.routeName:(context)=>ResultNd2Screen(),
  ResultNd3Screen.routeName:(context)=>ResultNd3Screen(),
  Total1Screen.routeName:(context)=>Total1Screen(),
  Total2Screen.routeName:(context)=>Total2Screen(),
  TotalScreen.routeName:(context)=>TotalScreen(),
  EventScreen.routeName:(context)=>EventScreen(),
  NotificationScreen.routeName:(context)=>NotificationScreen(),
  LibraryScreen.routeName:(context)=>LibraryScreen(),
  ScheduleScreen.routeName:(context)=>ScheduleScreen(),
  AttendanceScreen.routeName:(context)=>AttendanceScreen(),
  LibSessionsScreen.routName:(context)=>LibSessionsScreen(),
  BooksFirstSession.routName:(context)=>BooksFirstSession(),
  VideosSecondSession.routName:(context)=>VideosSecondSession(),
  LibraryType.routName:(context)=>LibraryType(),
  LibraryType2.routName:(context)=>LibraryType2(),
  //QuranDegree.routeName:(context)=>QuranDegree(subjectId: 1, subjectName: 'Quran',),
  EnglishDegree.routName:(context)=>EnglishDegree(),
  ArabicDegree.routName:(context)=>ArabicDegree(),
  MathDegree.routName:(context)=>MathDegree(),
  ScienceDegree.routName:(context)=>ScienceDegree(),
  IslamicDegree.routName:(context)=>IslamicDegree(),
  VideoFirstScreen.routName:(context)=>VideoFirstScreen(),
  QuranContentScreen.routeName:(context)=>QuranContentScreen(subjectId: 4, subjectName: 'َQuran'),
  ForgotPasswordPage.routeName:(context)=>ForgotPasswordPage(),
  ArabicDegree6.routName:(context)=>ArabicDegree6(),
  ScienceDegree6.routName:(context)=>ScienceDegree6(),
  MathDegree6.routName:(context)=>MathDegree6(),
  QuranDegree6.routName:(context)=>QuranDegree6(),
  IslamicDegree6.routName:(context)=>QuranDegree6(),
  EnglishDegree6.routName:(context)=>EnglishDegree6(),
  ArabicDegree5.routName:(context)=>ArabicDegree5(),
  QuranDegree5.routName:(context)=>QuranDegree5(),
  MathDegree5.routName:(context)=>MathDegree5(),
  IslamicDegree5.routName:(context)=>IslamicDegree5(),
  ScienceDegree5.routName:(context)=>ScienceDegree5(),
  EnglishDegree5.routName:(context)=>EnglishDegree5(),
  ArabicDegree4.routName:(context)=>ArabicDegree4(),
  QuranDegree4.routName:(context)=>QuranDegree4(),
  MathDegree4.routName:(context)=>MathDegree4(),
  IslamicDegree4.routName:(context)=>IslamicDegree4(),
  ScienceDegree4.routName:(context)=>ScienceDegree4(),
  EnglishDegree4.routName:(context)=>EnglishDegree4(),
  ArabicDegree3.routName:(context)=>ArabicDegree5(),
  QuranDegree3.routName:(context)=>QuranDegree3(),
  MathDegree3.routName:(context)=>MathDegree3(),
  IslamicDegree3.routName:(context)=>IslamicDegree3(),
  ScienceDegree3.routName:(context)=>ScienceDegree3(),
  EnglishDegree3.routName:(context)=>EnglishDegree3(),
  ArabicDegree2.routName:(context)=>ArabicDegree2(),
  QuranDegree2.routName:(context)=>QuranDegree2(),
  MathDegree2.routName:(context)=>MathDegree2(),
  IslamicDegree2.routName:(context)=>IslamicDegree2(),
  ScienceDegree2.routName:(context)=>ScienceDegree2(),
  EnglishDegree2.routName:(context)=>EnglishDegree2(),
//  StudentScreen.routeName:(context)=>StudentScreen(),
  IslamicContentScreen.routeName:(context)=>IslamicContentScreen(subjectId: 4, subjectName: 'Islamic'),
  ArabicContentScreen.routeName:(context)=>ArabicContentScreen(subjectId: 5, subjectName: 'Arabic'),
  MathContentScreen.routeName:(context)=>MathContentScreen(subjectId: 6, subjectName: 'math'),
  EnglishContentScreen.routeName:(context)=>EnglishContentScreen(subjectId: 8, subjectName: 'English'),
  ScienceContentScreen.routeName:(context)=>ScienceContentScreen(subjectId: 7, subjectName: 'Science'),
 // ParentHomeScreen.routeName:(context)=>ParentHomeScreen(student: ,),
  BooksFirstSession.routName:(context)=>BooksFirstSession(),
  BooksSecondSession.routeName:(context)=>BooksSecondSession(),
  Arabic2ContentScreen.routeName:(context)=>Arabic2ContentScreen(),
  Islamic2ContentScreen.routeName:(context)=>Islamic2ContentScreen(),
  English2ContentScreen.routeName:(context)=>English2ContentScreen(),
  Math2ContentScreen.routeName:(context)=>Math2ContentScreen(),
  Quran2ContentScreen.routeName:(context)=>Quran2ContentScreen(),
  Science2ContentScreen.routeName:(context)=>Science2ContentScreen(),
  MathPdfContentScreen.routeName:(context)=>MathPdfContentScreen(subjectId: 1, subjectName: 'math'),
  QuranPdfContentScreen.routeName:(context)=>QuranPdfContentScreen(subjectId: 4, subjectName: 'Quran'),
  IslamicPdfContentScreen.routeName:(context)=>IslamicPdfContentScreen(subjectId: 5, subjectName: 'Islamic'),
  ArabicPdfContentScreen.routeName:(context)=>ArabicPdfContentScreen(subjectId: 2, subjectName: 'Arabic'),
  EnglishPdfContentScreen.routeName:(context)=>EnglishPdfContentScreen(subjectId: 6, subjectName: 'English'),
  SciencePdfContentScreen.routeName:(context)=>SciencePdfContentScreen(subjectId: 7, subjectName: 'Science'),
  InComeMeetingScreen.routeName:(context)=>InComeMeetingScreen(meetStatus: true,/*meetStatus: 1,*/),
  PreMeetingScreen.routeName:(context)=>PreMeetingScreen(meetStatues: false),
  MeetingTypeScreen.routeName:(context)=>MeetingTypeScreen(),
  SelectSon.routName:(context)=>SelectSon(),


};