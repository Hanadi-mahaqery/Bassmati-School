import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/models/ScheduleModel.dart';
import 'package:school_app/blocs/schedule_bloc.dart';
import 'package:school_app/data_enum/state_types.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});
  static String routeName = 'ScheduleScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Schedule'),
      ),
      body: BlocBuilder<ScheduleBloc, ScheduleState>(
        builder: (context, state) {
          if (state.currentState == StateTypes.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.currentState == StateTypes.loaded) {
            if (state.items.isEmpty) {
              return Center(child: Text('No schedule records found.'));
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Table(
                    border: TableBorder.all(color: Colors.black),
                    columnWidths: {
                      0: FixedColumnWidth(100.0),
                      1: FixedColumnWidth(100.0),
                      2: FixedColumnWidth(100.0),
                      3: FixedColumnWidth(100.0),
                      4: FixedColumnWidth(100.0),
                      5: FixedColumnWidth(100.0),
                      6: FixedColumnWidth(100.0),
                      7: FixedColumnWidth(100.0),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: kOtherColor),
                        children: [
                          Padding(
                            padding: EdgeInsets.all(kDefaultPadding / 2),
                            child: Text('Day', style: TextStyle(color: kSecondaryColor, fontWeight: FontWeight.bold,fontSize: 25)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(kDefaultPadding / 2),
                            child: Text('First Period', style: TextStyle(color:kSecondaryColor, fontWeight: FontWeight.bold,fontSize: 25)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(kDefaultPadding / 2),
                            child: Text('Second Period', style: TextStyle(color: kSecondaryColor, fontWeight: FontWeight.bold,fontSize: 25)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(kDefaultPadding / 2),
                            child: Text('Third Period', style: TextStyle(color: kSecondaryColor, fontWeight: FontWeight.bold,fontSize: 25)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(kDefaultPadding / 2),
                            child: Text('Fourth Period', style: TextStyle(color: kSecondaryColor, fontWeight: FontWeight.bold,fontSize: 25)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(kDefaultPadding / 2),
                            child: Text('Fifth Period', style: TextStyle(color: kSecondaryColor, fontWeight: FontWeight.bold,fontSize: 25)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(kDefaultPadding / 2),
                            child: Text('Sixth Period', style: TextStyle(color: kSecondaryColor, fontWeight: FontWeight.bold,fontSize: 25)),
                          ),
                        ],
                      ),
                      for (var schedule in state.items)
                        TableRow(
                          decoration: BoxDecoration(color: kOtherColor),

                          children: [
                            Padding(
                              padding: EdgeInsets.all(kDefaultPadding / 2),
                              child: Text(schedule.day ?? '',style: TextStyle(
                              fontSize: 25,fontWeight: FontWeight.bold,color: kPrimaryColor
                              ),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(kDefaultPadding / 2),
                              child: Text(schedule.firstPeriod ?? '',style: TextStyle(
                                  fontSize: 25,fontWeight: FontWeight.normal,color: kPrimaryColor
                              )),
                            ),
                            Padding(
                              padding: EdgeInsets.all(kDefaultPadding / 2),
                              child: Text(schedule.seconedPeriod ?? '',style: TextStyle(
                                  fontSize: 25,fontWeight: FontWeight.normal,color: kPrimaryColor
                              )),
                            ),
                            Padding(
                              padding: EdgeInsets.all(kDefaultPadding / 2),
                              child: Text(schedule.thirdPeriod ?? '',style: TextStyle(
                                  fontSize: 25,fontWeight: FontWeight.normal,color: kPrimaryColor
                              )),
                            ),
                            Padding(
                              padding: EdgeInsets.all(kDefaultPadding / 2),
                              child: Text(schedule.forthPeriod ?? '',style: TextStyle(
                                  fontSize: 25,fontWeight: FontWeight.normal,color: kPrimaryColor
                              )),
                            ),
                            Padding(
                              padding: EdgeInsets.all(kDefaultPadding / 2),
                              child: Text(schedule.fifthPeriod ?? '',style: TextStyle(
                                  fontSize: 25,fontWeight: FontWeight.normal,color: kPrimaryColor
                              )),
                            ),
                            Padding(
                              padding: EdgeInsets.all(kDefaultPadding / 2),
                              child: Text(schedule.sixthPeriod ?? '',style: TextStyle(
                                  fontSize: 25,fontWeight: FontWeight.normal,color: kPrimaryColor
                              )),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
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
