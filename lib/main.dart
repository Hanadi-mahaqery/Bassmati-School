import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_app/FireBase_API/fireBase_api.dart';
import 'package:school_app/blocs/attendance_bloc.dart';
import 'package:school_app/blocs/examSchedule_bloc.dart';
import 'package:school_app/blocs/intallment_bloc.dart';
import 'package:school_app/blocs/library_bloc.dart';
import 'package:school_app/blocs/meeting_bloc.dart';
//import 'package:school_app/blocs/preMeeting_bloc.dart';
import 'package:school_app/blocs/stuProf_bloc.dart';
import 'package:school_app/blocs/student_bloc.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/repositories/event_repository.dart';
import 'package:school_app/repositories/examSchedule_repository.dart';
import 'package:school_app/repositories/install_repository.dart';
import 'package:school_app/repositories/library_repository.dart';
import 'package:school_app/repositories/meeting_repository.dart';
//import 'package:school_app/repositories/inComemeeting_repository.dart';
import 'package:school_app/repositories/pdf_repository.dart';
//import 'package:school_app/repositories/preMeeting_repository.dart';
import 'package:school_app/repositories/stuProf_repository.dart';
import 'package:school_app/repositories/student_repository.dart';
import 'package:school_app/repositories/attendance_repository.dart';
import 'package:school_app/routes.dart';
import 'package:school_app/screen/event_screen/event_screen.dart';
import 'package:school_app/screen/login_screen/login_screen.dart'; // تعديل: استيراد شاشة تسجيل الدخول
import 'package:school_app/screen/home_screen/home_screen.dart'; // تعديل: استيراد شاشة الرئيسية
import 'package:school_app/screen/splash_screen/splash_screen.dart';
import 'package:school_app/services/auth_services.dart'; // تعديل: استيراد خدمة المصادقة
import 'package:firebase_core/firebase_core.dart';
import 'blocs/event_bloc.dart';
//import 'blocs/inComeMeeting_bloc.dart';
import 'blocs/pdf_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // تهيئة Firebase مع الخيارات الافتراضية
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // تهيئة إشعارات Firebase
  await FirebaseApi().initNotification();

  // تشغيل التطبيق
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // فحص حالة تهيئة Firebase
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // إذا كانت حالة التهيئة في حالة الانتظار
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // عرض رمز التحميل أثناء التهيئة
        }

        // إذا كان هناك خطأ في التهيئة
        if (snapshot.hasError) {
          return Center(
            child: Text('خطأ في تهيئة Firebase: ${snapshot.error}'),
          );
        }

        // عندما تكون التهيئة ناجحة، قم بعرض التطبيق
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => LibraryBloc(repository: LibraryRepository())..add(FetchLibraryItemsBySubjectId(subjectId:1) ),
            ),
            BlocProvider(
              create: (_) => StudentBloc(repository: StudentRepository())..add(LoadStudentData()),
            ),
            BlocProvider(
              create: (_) => PdfBloc(repository: PdfRepository()),
            ),
            BlocProvider(
              create: (_) => MeetingBloc(repository: MeetingRepository()),
            ),
            BlocProvider(
              create: (context) => EventBloc(repository: EventRepository())..add(LoadEventData()),
              child: EventScreen(),
            ),
           /* BlocProvider<InComeMeetingBloc>(
              create: (context) => InComeMeetingBloc(repository:  InComeMeetingRepository())..add(LoadInMeetingData(meetStatus: 1)),
            ),
            BlocProvider<PreMeetingBloc>(
              create: (context) => PreMeetingBloc(repository:  PreMeetingRepsitory())..add(LoadPreMeetingData(meetStatues: 0)),
            ),*/
            BlocProvider<ExamScheduleBloc>(
              create: (context) => ExamScheduleBloc(repository:  ScheduleRepository())..add(LoadExamScheduleData()),
            ),
            BlocProvider<InstallmentBloc>(
              create: (context) => InstallmentBloc(repository:  InstallmentRepository())..add(LoadInstallmentData()),
            ),
            BlocProvider<StuProfBloc>(
              create: (context) => StuProfBloc(repository:  StuProfRepository())..add(FetchStudentItemsByStudentId(StudentId: 3)),
            ),
            BlocProvider(
              create: (context) => AttendanceBloc(repository: AttendanceRepository())
                ..add(LoadAttendanceData()),
            ),
            // Add any additional bloc providers here
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Basmati School',
            theme: ThemeData.light().copyWith(
              scaffoldBackgroundColor: kPrimaryColor,
              primaryColor: kPrimaryColor,
              appBarTheme: const AppBarTheme(
                color: kPrimaryColor,
                elevation: 0,
              ),
              textTheme: GoogleFonts.aBeeZeeTextTheme(Theme.of(context).textTheme).apply().copyWith(
                bodyMedium: const TextStyle(
                  color: kTextWhiteColor,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
                bodyLarge: const TextStyle(
                  color: kTextWhiteColor,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
                bodySmall: const TextStyle(
                  color: kTextWhiteColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              inputDecorationTheme: const InputDecorationTheme(
                labelStyle: TextStyle(
                  fontSize: 15.0,
                  color: kTextLightColor,
                  height: 8.5,
                ),
                hintStyle: TextStyle(
                  fontSize: 16.0,
                  color: kTextBlackColor,
                  height: 8.5,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kTextLightColor, width: 0.7),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: kTextLightColor),
                ),
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kTextLightColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor, width: 0.7),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kErrorBorderColor, width: 1.2),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kErrorBorderColor, width: 1.2),
                ),
              ),
            ),
            initialRoute: SplashScreen.routeName,
            routes: {
              ...routes, // يستخدم المسارات المعرفة سابقًا
              LoginScreen.routeName: (context) => LoginScreen(), // تعديل: إضافة شاشة تسجيل الدخول
              HomeScreen.routeName: (context) => HomeScreen(), // تعديل: إضافة شاشة الرئيسية
            },
          ),
        );
      },
    );
  }
}
