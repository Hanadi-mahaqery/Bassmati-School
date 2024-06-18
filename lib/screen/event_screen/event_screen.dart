import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/blocs/event_bloc.dart';
import 'package:school_app/models/EventModel.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/screen/event_screen/levels_events/level1_events.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});
  static String routeName = 'EventScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height /3.0,
              child: Column(
                children: [
                  Image.asset('assets/icons/eventsLevel.png',height: 150.0,width: 150.0,),
                  SizedBox(
                    height: kDefaultPadding /2,
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.w200),
                          ),
                          Text('Events',
                              style: Theme.of(context).textTheme.bodyMedium)
                        ],
                      )
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
                    topRight: Radius.circular(kDefaultPadding * 3)),
                color: kOtherColor,
              ),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LevelType(title: 'Level 1', icon: 'assets/icons/book.png', onPress:(){
                        Navigator.pushNamed(context, Level1Events.routeName);
                      }) ,
                      LevelType(title: 'Level 2', icon:'assets/icons/videos.png', onPress:(){
                        Navigator.pushNamed(context, Level1Events.routeName);
                      }) ,

                    ],
                  )
                ],

              ),
            ),


          ],
        ),
      );


  }
}

class LevelType extends StatelessWidget {
  const LevelType({super.key, required this.title, required this.icon, required this.onPress});
  final String title;
  final String icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return  InkWell(

      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding / 2),
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.height / 11,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(kDefaultPadding)),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(icon, height: 40.0, width: 40.0, color: kOtherColor),
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





/*  body: BlocBuilder<EventBloc, EventState>(
        builder: (context, state) {
          if (state.currentState == StateTypes.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.currentState == StateTypes.loaded) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                EventModel event = state.items[index];
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 2,
                        vertical: kDefaultPadding / 2,
                      ),
                      padding: EdgeInsets.all(kDefaultPadding / 1),
                      decoration: BoxDecoration(
                        color: kOtherColor,
                        borderRadius: BorderRadius.circular(kDefaultPadding * 2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: kDefaultPadding / 2),
                          Text(
                            event.eventName ?? '',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            ),
                          ),
                          Text(
                            event.eventDesc ?? '',
                            style: TextStyle(
                              color: kTextBlackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            event.eventDate ?? '',
                            style: TextStyle(
                              color: kTextBlackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            event.eventLocation ?? '',
                            style: TextStyle(
                              color: kTextBlackColor,
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
      ),*/
