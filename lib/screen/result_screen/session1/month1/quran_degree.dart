import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/blocs/results_bloc.dart';
import 'package:school_app/repositories/results_repository.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/ResultsModel.dart';

class QuranDegree extends StatelessWidget {
  const QuranDegree({super.key});
  static String routeName = 'QuranDegree';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quran Degree'),
      ),
      body: BlocProvider(
        create: (context) => ResultsBloc(repository: ResultsRepository())
          ..add(LoadResultsData()),
        child: BlocBuilder<ResultsBloc, ResultsState>(
          builder: (context, state) {
            if (state.currentState == StateTypes.loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.currentState == StateTypes.loaded) {
              if (state.items.isEmpty) {
                return Center(child: Text("No data found"));
              }
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kDefaultPadding * 3),
                        topRight: Radius.circular(kDefaultPadding * 3),
                        bottomLeft: Radius.circular(kDefaultPadding * 3),
                        bottomRight: Radius.circular(kDefaultPadding * 3),
                      ),
                      color: kOtherColor,
                    ),
                    child: Center(
                      child: DataTable(
                        columnSpacing: 8.0,
                        columns: [
                          DataColumn(
                            label: Text('الدرجة'),
                          ),
                          DataColumn(
                            label: Text('النوع'),
                            numeric: true,
                          ),
                        ],
                        rows: state.items.map((result) {
                          return DataRow(
                            cells: [
                              DataCell(Text(result.totalResult?.toString() ?? 'N/A',
                                  style: TextStyle(fontSize: 20, color: kTextBlackColor))),
                              DataCell(Text(result.grade ?? 'N/A',
                                  style: TextStyle(fontSize: 18, color: kPrimaryColor))),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: kDefaultPadding),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 8,
                    padding: const EdgeInsets.all(kDefaultPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kDefaultPadding * 3),
                        topRight: Radius.circular(kDefaultPadding * 3),
                        bottomLeft: Radius.circular(kDefaultPadding * 3),
                        bottomRight: Radius.circular(kDefaultPadding * 3),
                      ),
                      color: kOtherColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'ملاحظات المعلم',
                            style: TextStyle(fontSize: 18, color: kTextBlackColor),
                          ),
                        ),
                        SizedBox(height: 8),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.items.length,
                            itemBuilder: (context, index) {
                              return Center(
                                child: Text(
                                  state.items[index].taskDegree?.toString() ?? 'N/A',
                                  style: TextStyle(fontSize: 16, color: kPrimaryColor),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state.currentState == StateTypes.error) {
              return Center(child: Text("Error: ${state.error}"));
            } else {
              return Center(child: Text("Unknown state"));
            }
          },
        ),
      ),
    );
  }
}
