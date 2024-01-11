import 'package:flutter/material.dart';
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
import 'package:school_app/screen/result_screen/months_result/months_result.dart';
import 'package:school_app/screen/result_screen/session1/result_screen.dart';
import 'package:school_app/screen/result_screen/sessions_screen/session_screen.dart';
import 'package:school_app/screen/schedule_screen/schedule_screen.dart';
import 'package:school_app/screen/student_profile/student_profile.dart';

import 'widgets/student_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StudentName(
                          studentName: 'Fatima',
                        ),
                        kHalfSizedBox,
                        StudentClass(studentClass: 'Level 3 class A'),
                        kHalfSizedBox,
                      StudentYear(studentYear: '2023-2024')
                      ],
                    ),
                   kHalfSizedBox,
                   StudentPicture(pictureAddress: 'assets/images/kid.jpg', onPress:(){
                     Navigator.pushNamed(context, StudentProfile.routeName);
                   })
                  ],
                ),
               sizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StudentDataCard(title: 'Attendance', value: '90.2%', onPress: (){
                      Navigator.pushNamed(context, AttendanceScreen.routeName);

                    }),
                    StudentDataCard(title: 'Fees Due', value: '600\$', onPress: (){
                      Navigator.pushNamed(context, FeeScreen.routName);
                    }),


                  ],
                )
              ],
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
                      topRight: Radius.circular(kDefaultPadding * 3)),
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

class HomeCard extends StatelessWidget {
  const HomeCard(
      {super.key,
      required this.onPress,
      required this.icon,
      required this.title});
  final VoidCallback onPress;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding / 2),
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(kDefaultPadding)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(icon, height: 40.0, width: 40.0, color: kOtherColor),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: kDefaultPadding / 3,
            )
          ],
        ),
      ),
    );
  }
}
