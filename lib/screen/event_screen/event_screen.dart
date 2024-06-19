import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/blocs/event_bloc.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/data_enum/state_types.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});
  static String routeName = 'EventScreen';

  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<EventBloc>(context);

    // جلب البيانات عند تحميل الواجهة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc.add(LoadEventData());
    });

    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.0,
            child: Column(
              children: [
                Image.asset('assets/icons/eventsLevel.png', height: 150.0, width: 150.0),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Up Coming',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w200),
                        ),
                        Text('Events', style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kDefaultPadding * 3),
                topRight: Radius.circular(kDefaultPadding * 3),
              ),
              color: kOtherColor,
            ),
            child: BlocBuilder<EventBloc, EventState>(
              builder: (context, state) {
                if (state.currentState == StateTypes.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.currentState == StateTypes.loaded) {
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      var event = state.items[index];
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding / 2,
                              vertical: kDefaultPadding / 2,
                            ),
                            padding: EdgeInsets.all(kDefaultPadding / 1),
                            decoration: BoxDecoration(
                              color: kPrimaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(kDefaultPadding * 2),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: kDefaultPadding / 2),
                                Text(
                                  'Event Name:',
                                  style: TextStyle(
                                    color: kPrimaryColor, // لون عنوان البيانات
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                                Text(
                                  '${event.eventName ?? ''}',
                                  style: TextStyle(
                                    color: kTextBlackColor, // لون البيانات
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                ),
                                SizedBox(height: kDefaultPadding / 2),
                                Text(
                                  'Event Description:',
                                  style: TextStyle(
                                    color: kPrimaryColor, // لون عنوان البيانات
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                                Text(
                                  '${event.eventDesc ?? ''}',
                                  style: TextStyle(
                                    color: kTextBlackColor, // لون البيانات
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                ),
                                SizedBox(height: kDefaultPadding / 2),
                                Text(
                                  'Event Date:',
                                  style: TextStyle(
                                    color: kPrimaryColor, // لون عنوان البيانات
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                                Text(
                                  '${event.eventDate ?? ''}',
                                  style: TextStyle(
                                    color: kTextBlackColor, // لون البيانات
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                ),
                                SizedBox(height: kDefaultPadding / 2),
                                Text(
                                  'Event Location:',
                                  style: TextStyle(
                                    color: kPrimaryColor, // لون عنوان البيانات
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                                Text(
                                  '${event.eventLocation ?? ''}',
                                  style: TextStyle(
                                    color: kTextBlackColor, // لون البيانات
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5.0),
                        ],
                      );
                    },
                  );
                } else if (state.currentState == StateTypes.error) {
                  return Center(child: Text('Error: ${state.error}'));
                } else {
                  return Center(child: Text('No Events Found'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
