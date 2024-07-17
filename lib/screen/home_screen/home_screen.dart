import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/all_sign/all_sign.dart';
import 'package:school_app/screen/assignment_screen/assignment_screen.dart';
import 'package:school_app/screen/attendence_screen/attendence_screen.dart';
import 'package:school_app/screen/event_screen/event_screen.dart';
import 'package:school_app/screen/exam_schedule/exam_schedule.dart';
import 'package:school_app/screen/fee_screen/fee_screen.dart';
import 'package:school_app/screen/library_screen/library_screen.dart';
import 'package:school_app/screen/library_screen/lib_sessions_screen.dart';
import 'package:school_app/screen/login_screen/login_screen.dart';
import 'package:school_app/screen/notification_screen/notification_screen.dart';
import 'package:school_app/screen/result_screen/session1/months_result.dart';
import 'package:school_app/screen/result_screen/session1/months/result_screen.dart';
import 'package:school_app/screen/result_screen/sessions_screen/session_screen.dart';
import 'package:school_app/screen/schedule_screen/schedule_screen.dart';
import 'package:school_app/screen/student_profile/student_profile.dart';

import '../../blocs/stuProf_bloc.dart';
import '../../blocs/student_bloc.dart';
import '../../data_enum/state_types.dart';
import '../ParentHomeScreen/ParentHomeScreen.dart';
import '../image.dart';
import 'widgets/student_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            padding: EdgeInsets.all(kDefaultPadding),
            child: BlocBuilder<StudentBloc, StudentState>( // استخدام BlocBuilder لاستدعاء StuProfBloc
              builder: (context, state) {
                if (state.currentState == StateTypes.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.currentState == StateTypes.loaded) {
                  // عرض صورة الطالب باستخدام CircleAvatar
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCachedImage(
                        imageUrl: state.items.isNotEmpty && state.items[0].stuImage != null
                            ? "http://localhost:5259/${state.items[0].stuImage}"
                            : "default_image_url",
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(height: kDefaultPadding / 2),

                      SizedBox(height:  kDefaultPadding / 2,),
                      Text(
                        state.items.isNotEmpty ? state.items[0].stuName! : 'اسم الطالب',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height:  kDefaultPadding / 2,),
                      Text(
                        'الصف 3 - فئة A', // يجب استبدالها بالبيانات الفعلية من الـ Bloc
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height:  kDefaultPadding / 2,),
                      Text(
                        '2023-2024', // يجب استبدالها بالبيانات الفعلية من الـ Bloc
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  );
                } else {
                  return Center(child: Text('حدث خطأ أثناء جلب بيانات الطالب.'));
                }
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: kOtherColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 3),
                    topRight: Radius.circular(kDefaultPadding * 3),
                  ),
                ),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {
                              Navigator.pushNamed(context, AssignmentScreen.routeName);
                            },
                            icon: 'assets/images/hw.png',
                            title: 'Tasks'),
                        HomeCard(
                            onPress: () {
                              Navigator.pushNamed(context, ScheduleScreen.routeName);

                            },
                            icon: 'assets/icons/calender2.png',
                            title: 'Schedule'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {
                              Navigator.pushNamed(context,SessionScreen.routeName);
                            },
                            icon: 'assets/icons/results.png',
                            title: 'Results'),
                        HomeCard(
                            onPress: () {
                              Navigator.pushNamed(context, ExamScreen.routeName);
                            },
                            icon: 'assets/icons/Exam.png',
                            title: 'Exams\n Schedule'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {
                              Navigator.pushNamed(context, EventScreen.routeName);

                            },
                            icon: 'assets/icons/events.png',
                            title: 'Events'),
                        HomeCard(
                            onPress: () {
                              Navigator.pushNamed(context, LibSessionsScreen.routName);

                            },
                            icon: 'assets/icons/library.png',
                            title: 'Library'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {
                              Navigator.pushNamed(context, NotificationScreen.routeName);

                            },
                            icon: 'assets/icons/notification.png',
                            title: 'Notifications'),
                        HomeCard(
                            onPress: () {
                              showDialog(context: context, builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text('Log out'),
                                  content: Text('Are you sure you want to log out?'),
                                  actions: <Widget>[
                                    TextButton(onPressed: (){
                                      Navigator.pushNamed(context, AllSign.routName);
                                    }, child: Text('Yes')),
                                    TextButton(onPressed: (){
                                      Navigator.pushNamed(context, HomeScreen.routeName);
                                    }, child: Text('No')),

                                  ],
                                );
                              });
                            },
                            icon: 'assets/icons/logout.png',
                            title: 'Log out'),
                      ],
                    )
                    // الأزرار والأيقونات الأخرى هنا
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
