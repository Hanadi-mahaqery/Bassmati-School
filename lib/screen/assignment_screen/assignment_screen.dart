import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/models/TaskHwModel.dart';
import 'package:school_app/blocs/taskHw_bloc.dart';
import 'package:school_app/data_enum/state_types.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key});
  static String routeName = 'AssignmentScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: BlocBuilder<TaskHwBloc, TaskHwState>(
        builder: (context, state) {
          if (state.currentState == StateTypes.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.currentState == StateTypes.loaded) {
            if (state.items.isEmpty) {
              return Center(child: Text('No tasks found.'));
            }
            return Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: kOtherColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kDefaultPadding),
                        topRight: Radius.circular(kDefaultPadding),
                      ),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.all(kDefaultPadding),
                      itemCount: state.items.length,
                      itemBuilder: (context, int index) {
                        final task = state.items[index];
                        DateTime assignDate = DateTime.parse(task.assignDate!);
                        DateTime lastDate = DateTime.parse(task.lastDate!);
                        // تنسيق التاريخ لعرض اليوم والشهر فقط
                        String formattedDate = DateFormat('dd MMM').format(assignDate);
                        String formattedDate2 = DateFormat('dd MMM').format(lastDate);
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
                            ],
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
                                    task.hwName ?? '',
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w400,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              kHalfSizedBox,
                              Text(
                                task.hwContent ?? '',
                                style: TextStyle(
                                  color: kTextBlackColor,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              kHalfSizedBox,
                              Text(
                                'Assign Date: $formattedDate',
                                style: TextStyle(
                                  color: kTextBlackColor,
                                  fontSize: 14.0,
                                ),
                              ),
                              kHalfSizedBox,
                              Text(
                                'Last Date: $formattedDate2',
                                style: TextStyle(
                                  color: kTextBlackColor,
                                  fontSize: 14.0,
                                ),
                              ),
                                  kHalfSizedBox,
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
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
