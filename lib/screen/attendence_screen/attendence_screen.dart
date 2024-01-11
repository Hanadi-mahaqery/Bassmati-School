import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});
  static String routeName = 'AttendanceScreen';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[

        CustomScrollView(
            slivers:[
              SliverAppBar(
                pinned: true,


                title: Text('Attendance'),)
            ]),
        /*  Container(height: 200,width: 200,
          decoration: BoxDecoration(
            color: kOtherColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))
          ),
            child:
            ,)*/
        ],
      ),
    );
  }
}
