import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);
  static String routeName = 'AttendanceScreen';

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  //late CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
   // _calendarController = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 200,
                title: Text('Attendance'),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: kSecondaryColor,
                 /* child: TableCalendar(
                    calendarController: _calendarController,
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                        fontSize: 16.0, // Ø­Ø¬Ù Ø§ÙØ£ÙØ§Ù ÙÙ Ø£ÙØ§Ù Ø§ÙØ£Ø³Ø¨ÙØ¹
                      ),
                      weekendStyle: TextStyle(
                        fontSize: 16.0, // Ø­Ø¬Ù Ø§ÙØ£ÙØ§Ù ÙÙ Ø¹Ø·ÙØ© ÙÙØ§ÙØ© Ø§ÙØ£Ø³Ø¨ÙØ¹
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onDaySelected: (date, events, holidays) {},
                  ),*/
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
