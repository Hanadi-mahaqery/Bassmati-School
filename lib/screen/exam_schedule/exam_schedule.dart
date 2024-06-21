import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/blocs/examSchedule_bloc.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:intl/intl.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});
  static const String routeName = 'ExamScreen';

  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<ExamScheduleBloc>(context);

    // جلب البيانات عند تحميل الواجهة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc.add(LoadExamScheduleData());
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Exam Schedule'),
      ),
      body: BlocBuilder<ExamScheduleBloc, ExamScheduleState>(
        builder: (context, state) {
          if (state.currentState == StateTypes.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.currentState == StateTypes.loaded) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: kOtherColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(kDefaultPadding),
                  topLeft: Radius.circular(kDefaultPadding),
                ),
              ),
              child: ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  var exam = state.items[index];

                  // تحويل التاريخ من النص إلى كائن DateTime
                  DateTime examDate = DateTime.parse(exam.examDate!);
                  // تنسيق التاريخ لعرض اليوم والشهر فقط
                  String formattedDate = DateFormat('dd MMM').format(examDate);

                  return Container(
                    margin: EdgeInsets.only(
                      left: kDefaultPadding / 2,
                      right: kDefaultPadding / 2,
                    ),
                    padding: EdgeInsets.all(kDefaultPadding / 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: kDefaultPadding,
                          child: Divider(
                            thickness: 1.0,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  formattedDate,
                                  style: TextStyle(
                                    color: kTextBlackColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  exam.examDay ?? '',
                                  style: TextStyle(
                                    color: kTextBlackColor,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  exam.subName ?? '',
                                  style: TextStyle(
                                    color: kTextBlackColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  exam.examTime ?? '',
                                  style: TextStyle(
                                    color: kTextBlackColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (state.currentState == StateTypes.error) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Center(child: Text('No Exam Schedule Found'));
          }
        },
      ),
    );
  }
}
