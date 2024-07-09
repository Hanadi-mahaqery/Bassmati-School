import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/Meetings/inCome_meetings_screen.dart';
import 'package:school_app/screen/assignment_screen/assignment_screen.dart';
import 'package:school_app/screen/attendence_screen/attendence_screen.dart';
import 'package:school_app/screen/event_screen/event_screen.dart';
import 'package:school_app/screen/exam_schedule/exam_schedule.dart';
import 'package:school_app/screen/fee_screen/fee_screen.dart';
import 'package:school_app/screen/library_screen/lib_sessions_screen.dart';
import 'package:school_app/screen/login_screen/login_screen.dart';
import 'package:school_app/screen/notification_screen/notification_screen.dart';
import 'package:school_app/screen/result_screen/sessions_screen/session_screen.dart';
import 'package:school_app/screen/schedule_screen/schedule_screen.dart';
import 'package:school_app/screen/student_profile/student_profile.dart';

import '../../blocs/stuProf_bloc.dart';
import '../../data_enum/state_types.dart';
import '../Meetings/Meeting_type.dart';
import '../all_sign/all_sign.dart';
import '../home_screen/widgets/student_data.dart';

class ParentHomeScreen extends StatelessWidget {
  const ParentHomeScreen({Key? key}) : super(key: key);

  static String routeName = 'ParentHomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            padding: EdgeInsets.all(kDefaultPadding),
            child: BlocBuilder<StuProfBloc, StuProfState>(
              builder: (context, state) {
                if (state.currentState == StateTypes.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.currentState == StateTypes.loaded) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (state.items.isNotEmpty) {
                            Navigator.pushNamed(
                              context,
                              StudentProfile.routeName,
                              // افترض أن معرف الطالب هو id
                            );
                          }
                        },
                        child: CircleAvatar(
                          maxRadius: 50.0,
                          minRadius: 50.0,
                          backgroundColor: kSecondaryColor,
                          backgroundImage: state.items.isNotEmpty && state.items[0].stuImage != null
                              ? MemoryImage(base64Decode(state.items[0].stuImage!))
                              : null,
                          child: state.items.isEmpty || state.items[0].stuImage == null
                              ? Icon(Icons.person, size: 50)
                              : null,
                        ),
                      ),
                      SizedBox(height: kDefaultPadding / 2),
                      Text(
                        state.items.isNotEmpty ? state.items[0].stuName! : 'اسم الطالب',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: kDefaultPadding / 2),
                      Text(
                        'الصف 3 - فئة A', // يجب استبدالها بالبيانات الفعلية من الـ Bloc
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: kDefaultPadding / 2),
                      Text(
                        '2023-2024', // يجب استبدالها بالبيانات الفعلية من الـ Bloc
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(height: kDefaultPadding / 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          StudentDataCard(title: 'Attendance', value: '90.2%', onPress: () {
                            Navigator.pushNamed(context, AttendanceScreen.routeName);
                          }),
                          StudentDataCard(title: 'Fees Due', value: '600\$', onPress: () {
                            Navigator.pushNamed(context, FeeScreen.routName);
                          }),
                        ],
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
                    topLeft: Radius.circular(kDefaultPadding * 2),
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
                          title: 'Tasks',
                        ),
                        HomeCard(
                          onPress: () {
                            Navigator.pushNamed(context, ScheduleScreen.routeName);
                          },
                          icon: 'assets/icons/calender2.png',
                          title: 'Schedule',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {
                            Navigator.pushNamed(context, SessionScreen.routeName);
                          },
                          icon: 'assets/icons/results.png',
                          title: 'Results',
                        ),
                        HomeCard(
                          onPress: () {
                            Navigator.pushNamed(context, ExamScreen.routeName);
                          },
                          icon: 'assets/icons/Exam.png',
                          title: 'Exams\n Schedule',
                        ),
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
                          title: 'Events',
                        ),
                        HomeCard(
                          onPress: () {
                            Navigator.pushNamed(context, LibSessionsScreen.routName);
                          },
                          icon: 'assets/icons/library.png',
                          title: 'Library',
                        ),
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
                          title: 'Notifications',
                        ),
                        HomeCard(
                          onPress: () {
                            Navigator.pushNamed(context, MeetingTypeScreen.routeName);
                          },
                          icon: 'assets/icons/parent.png',
                          title: 'Meetings',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Log out'),
                                  content: Text('Are you sure you want to log out?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, AllSign.routName);
                                      },
                                      child: Text('Yes'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, ParentHomeScreen.routeName);
                                      },
                                      child: Text('No'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: 'assets/icons/logout.png',
                          title: 'Log out',
                        ),
                      ],
                    ),
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
  const HomeCard({
    Key? key,
    required this.onPress,
    required this.icon,
    required this.title,
  }) : super(key: key);

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
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 40.0,
              width: 40.0,
              color: kOtherColor,
            ),
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
