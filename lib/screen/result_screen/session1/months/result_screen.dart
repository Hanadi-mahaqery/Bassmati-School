import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/blocs/results_bloc.dart';
import 'package:school_app/repositories/results_repository.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/ResultsModel.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  static String routeName = 'ResultScreen';

  @override
  Widget build(BuildContext context) {
    final int monthId = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: Text('Results for Month $monthId'),
      ),
      body: BlocProvider(
        create: (context) => ResultBloc(repository: ResultsRepository())..add(FetchResultsItemsByMonthId(monthId: monthId)),
        child: ResultsListView(),
      ),
    );
  }
}

class ResultsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultBloc, ResultState>(
      builder: (context, state) {
        if (state.currentState == StateTypes.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.currentState == StateTypes.error) {
          return Center(child: Text(state.error ?? 'An error occurred'));
        } else if (state.currentState == StateTypes.loaded) {
          return ListView.builder(
            padding: EdgeInsets.all(kDefaultPadding),
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              final item = state.items[index];
              return ListTile(
                title: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SubjectDetailsScreen(subject: item),
                      ),
                    );
                  },
                  child: Text(item.subjectName!),
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}

class SubjectDetailsScreen extends StatelessWidget {
  final ResultsModel subject;

  const SubjectDetailsScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject.subjectName!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Table(
          border: TableBorder.all(),
          children: [
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Category', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Degree', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Task Degree'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${subject.task}'),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Attend Degree'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${subject.attend}'),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Discipline Degree'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${subject.discipline}'),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Exam Degree'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${subject.exam}'),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Oral Degree'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${subject.oral}'),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Total Degree'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${subject.totalMonth}'),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}