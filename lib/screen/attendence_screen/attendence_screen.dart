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
            return Column(
              children: [
                TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: DateTime.now(),
                  calendarFormat: CalendarFormat.month,
                  calendarStyle: CalendarStyle(
                    weekendTextStyle: TextStyle(color: Colors.deepPurple, fontSize: 12),
                    defaultTextStyle: TextStyle(fontSize: 12),
                    cellPadding: EdgeInsets.all(4.0), // Reduced padding for cells
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: TextStyle(color: Colors.deepPurple, fontSize: 12),
                    weekdayStyle: TextStyle(fontSize: 12),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleTextStyle: TextStyle(fontSize: 16), // Smaller header text
                    leftChevronIcon: Icon(Icons.chevron_left, size: 20), // Smaller chevron icons
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
                        margin: EdgeInsets.all(4.0), // Reduced margin for cells
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isAbsent ? Colors.red : isWeekend ? Colors.deepPurple : null,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${day.day}',
                          style: TextStyle(
                            color: isAbsent || isWeekend ? Colors.white : null,
                            fontSize: 12, // Smaller day text
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
                      color: Colors.red,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                    ),
                    Text('غياب', style: TextStyle(fontSize: 14)),
                    SizedBox(width: 16),
                    Container(
                      width: 20,
                      height: 20,
                      color: Colors.deepPurple,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                    ),
                    Text('عطلة نهاية الأسبوع', style: TextStyle(fontSize: 14)),
                  ],
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
