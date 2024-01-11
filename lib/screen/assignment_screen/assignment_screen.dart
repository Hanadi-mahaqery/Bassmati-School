import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/assignment_screen/data/assignment_data.dart';

import 'widgets/assignment_widgets.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key});
  static String routeName = 'AssignmentScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: kOtherColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding),
                    topRight: Radius.circular(kDefaultPadding),
                  )),
              child: ListView.builder(
                padding: EdgeInsets.all(kDefaultPadding),
                  itemCount: assignment.length,
                  itemBuilder: (context, int index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: kDefaultPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(kDefaultPadding),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kDefaultPadding),
                            color: kOtherColor,
                            boxShadow: [
                              BoxShadow(
                                color: kTextLightColor,
                                blurRadius: 2.0,
                              )
                            ]
                          ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: kSecondaryColor.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(kDefaultPadding),
                                  ),
                                  child: Center(
                                    child: Text(
                                      assignment[index].subjectName,
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w400,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ),

                                ),
                                kHalfSizedBox,
                                Text(assignment[index].topicName,
                                style: TextStyle(
                                  color: kTextBlackColor,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,

                                ),
                                ),
                                kHalfSizedBox,
                              AssignmentDetailRow(
                                  title:'Assign Date',
                                  statusValue: assignment[index].assignData),
                                kHalfSizedBox,
                                AssignmentDetailRow(
                                    title:'Last Date',
                                    statusValue: assignment[index].assignData),
                                kHalfSizedBox,
                                AssignmentDetailRow(
                                    title:'Status',
                                    statusValue: assignment[index].status),
                                kHalfSizedBox,
                                if(assignment[index].status =='Pending')
                                AssignmentButton(title: 'To be Submitted', onPress: (){})
                               
                              ],
                            ),
                        )],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

