import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/result_screen/session1/months/result_screen.dart';
import 'package:school_app/blocs/month_bloc.dart';
import 'package:school_app/models/MonthModel.dart';
import '../../../data_enum/state_types.dart';
import '../../../repositories/month_repository.dart';
import 'moths2/result_nd_1.dart';

class Months2Results extends StatelessWidget {
  const Months2Results({super.key});
  static String routeName = 'Months2Results';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Months'),
      ),
      body: BlocProvider(
        create: (context) => MonthBloc(repository: MonthRepository())..add(FetchMonthItemsBySessionName(YearId: 3)),
        child: MonthsListView(),
      ),
    );
  }
}

class MonthsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonthBloc, MonthState>(
      builder: (context, state) {
        if (state.currentState == StateTypes.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.currentState == StateTypes.error) {
          return Center(child: Text(state.error ?? 'An error occurred'));
        } else if (state.currentState == StateTypes.loaded) {
          return ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.0,
                child: Column(
                  children: [
                    SizedBox(height: kDefaultPadding / 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Welcome ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w200),
                            ),
                            Text('Fatima',
                                style: Theme.of(context).textTheme.bodyMedium)
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: kDefaultPadding),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kDefaultPadding * 3),
                      topRight: Radius.circular(kDefaultPadding * 3)),
                  color: kOtherColor,
                ),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: state.items.map((month) {
                    return MonthNumber(
                      title: month.monthName!,
                      onPress: () {
                        Navigator.pushNamed(
                          context,
                          ResultNd1Screen.routeName,
                          arguments: month.monthId,
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}

class MonthNumber extends StatelessWidget {
  const MonthNumber({super.key, required this.title, required this.onPress});
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding / 4),
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.height / 11,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(kDefaultPadding)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: kDefaultPadding / 3,
            )
          ],
        ),
      ),
    );
  }
}