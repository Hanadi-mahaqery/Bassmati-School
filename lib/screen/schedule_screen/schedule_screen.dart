import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/schedule_screen/schedule_data.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);
  static String routeName = 'ScheduleScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          color: kSecondaryColor,
          child: DataTable(

            columns: [
              DataColumn(
                label: Text('Day', style: TextStyle(fontSize: 13.0)),
              ),
              DataColumn(
                label: Text('First', style: TextStyle(fontSize: 13.0)),
              ),
              DataColumn(
                label: Text('Second', style: TextStyle(fontSize: 13.0)),
              ),
              DataColumn(
                label: Text('Third', style: TextStyle(fontSize: 13.0)),
              ),
              DataColumn(
                label: Text('Forth', style: TextStyle(fontSize: 13.0)),
              ), DataColumn(
                label: Text('Fifth', style: TextStyle(fontSize: 13.0)),
              ), DataColumn(
                label: Text('Sixth', style: TextStyle(fontSize: 13.0)),
              ),
            ],
            rows: List.generate(scheduleData.length, (index) {
              return DataRow(
                cells: [
                  DataCell(Text(scheduleData[index].day,
                      style: TextStyle(fontSize: 16, color: kTextWhiteColor))),
                  DataCell(Text(scheduleData[index].subject1,
                      style: TextStyle(fontSize: 13, color: kTextWhiteColor))),
                  DataCell(Text(scheduleData[index].subject2,
                      style: TextStyle(fontSize: 13, color: kTextWhiteColor))),
                  DataCell(Text(scheduleData[index].subject3,
                      style: TextStyle(fontSize: 13, color: kTextWhiteColor))),
                  DataCell(Text(scheduleData[index].subject4,
                      style: TextStyle(fontSize: 13, color: kTextWhiteColor))),
                  DataCell(Text(scheduleData[index].subject5,
                      style: TextStyle(fontSize: 13, color: kTextWhiteColor))),
                  DataCell(Text(scheduleData[index].subject6,
                      style: TextStyle(fontSize: 13, color: kTextWhiteColor))),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }


  }
