// quran_degree.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/blocs/results_bloc.dart';
import 'package:school_app/repositories/results_repository.dart';
import 'package:school_app/data_enum/state_types.dart';

class QuranDegree extends StatelessWidget {
  final int subjectId;
  final String subjectName;

  const QuranDegree({super.key, required this.subjectId, required this.subjectName});

  static String routeName = 'QuranDegree';

  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<ResultBloc>(context);

    // جلب الدرجات بناءً على subjectId
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc.add(FetchResultsItemsBySubjectId(subjectId: subjectId));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Quran Degree'),
      ),
      body: BlocBuilder<ResultBloc, ResultState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state.currentState == StateTypes.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.currentState == StateTypes.loaded) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                var result = state.items[index];

                return Container(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2, vertical: kDefaultPadding / 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kDefaultPadding * 2),
                    color: kOtherColor,
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Divider(thickness: 1.0, height: kDefaultPadding),
                        Text(
                          'Total Month: ${result.totalMonth?.toString() ?? 'N/A'}',
                          style: const TextStyle(color: kPrimaryColor, fontSize: 26.0, fontWeight: FontWeight.bold),
                        ),
                        const Divider(thickness: 1.0, height: kDefaultPadding),

                        const SizedBox(height: kDefaultPadding / 4),
                        Text(
                          'Task Degree: ${result.taskDegree?.toString() ?? 'N/A'}',
                          style: const TextStyle(color: kPrimaryColor, fontSize: 20.0),
                        ),
                        const Divider(thickness: 1.0, height: kDefaultPadding),

                        Text(
                          'Attendance Degree: ${result.attendDegree?.toString() ?? 'N/A'}',
                          style: const TextStyle(color: kPrimaryColor, fontSize: 20.0),
                        ),
                        const Divider(thickness: 1.0, height: kDefaultPadding),

                        Text(
                          ' Discipline Degree: ${result.disciplineDegree?.toString() ?? 'N/A'}',
                          style: const TextStyle(color: kPrimaryColor, fontSize: 20.0),
                        ),
                        const Divider(thickness: 1.0, height: kDefaultPadding),


                        Text(
                          'Oral Degree: ${result.oralDegree?.toString() ?? 'N/A'}',
                          style: const TextStyle(color: kPrimaryColor, fontSize: 20.0),
                        ),
                        const Divider(thickness: 1.0, height: kDefaultPadding),

                        Text(
                          ' Exam Degree${result.examDegree?.toString() ?? 'N/A'}',
                          style: const TextStyle(color: kPrimaryColor, fontSize: 20.0),
                        ),
                        const Divider(thickness: 1.0, height: kDefaultPadding),

                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state.currentState == StateTypes.error) {
            return Center(
              child: Text("Error: ${state.error}"),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
