import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/models/AttendanceModel.dart';
import 'package:school_app/blocs/attendance_bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  static String routeName = 'AttendanceScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
        backgroundColor: kPrimaryColor,
      ),
      body: BlocBuilder<AttendanceBloc, AttendanceState>(
        builder: (context, state) {
          if (state.currentState == StateTypes.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.currentState == StateTypes.loaded) {
            if (state.items.isEmpty) {
              return Center(child: Text('No attendance records found.'));
            }

            // حساب عدد أيام الغياب
            int absentDays = state.items.where((attendance) => !attendance.attendStatus!).length;

            return Column(
              children: [
                TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: DateTime.now(),
                  calendarFormat: CalendarFormat.month,
                  calendarStyle: CalendarStyle(
                    weekendTextStyle: TextStyle(color: Colors.teal, fontSize: 12),
                    defaultTextStyle: TextStyle(fontSize: 12),
                    outsideTextStyle: TextStyle(fontSize: 12),
                    cellPadding: EdgeInsets.all(4.0),
                    outsideDecoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    defaultDecoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: TextStyle(color: Colors.teal, fontSize: 12),
                    weekdayStyle: TextStyle(fontSize: 12),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleTextStyle: TextStyle(fontSize: 16),
                    leftChevronIcon: Icon(Icons.chevron_left, size: 20),
                    rightChevronIcon: Icon(Icons.chevron_right, size: 20),
                  ),
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, day, focusedDay) {
                      bool isWeekend = day.weekday == DateTime.thursday || day.weekday == DateTime.friday;
                      bool isAbsent = state.items.any((attendance) =>
                      DateTime.parse(attendance.attendDate!).year == day.year &&
                          DateTime.parse(attendance.attendDate!).month == day.month &&
                          DateTime.parse(attendance.attendDate!).day == day.day &&
                          !attendance.attendStatus!);

                      return Container(
                        margin: EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isAbsent ? Colors.redAccent : isWeekend ? Colors.blueGrey : null,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${day.day}',
                          style: TextStyle(
                            color: isAbsent || isWeekend ? Colors.white : Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      );
                    },
                    outsideBuilder: (context, day, focusedDay) {
                      bool isWeekend = day.weekday == DateTime.thursday || day.weekday == DateTime.friday;
                      return Container(
                        margin: EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${day.day}',
                          style: TextStyle(
                            color: isWeekend ? Colors.teal : Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      color: Colors.redAccent,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                    ),
                    Text('غياب', style: TextStyle(fontSize: 14)),
                    SizedBox(width: 16),
                    Container(
                      width: 20,
                      height: 20,
                      color: Colors.blueGrey,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                    ),
                    Text('عطلة نهاية الأسبوع', style: TextStyle(fontSize: 14)),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'عدد أيام الغياب: $absentDays',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            );
          } else if (state.currentState == StateTypes.error) {
            return Center(child: Text(state.error ?? 'An error occurred.'));
          }
          return Center(child: Text('Unknown state.'));
        },
      ),
    );
  }
}