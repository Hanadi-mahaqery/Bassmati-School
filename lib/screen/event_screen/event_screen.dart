import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/event_screen/events_data.dart';


class EventScreen extends StatelessWidget {
  const EventScreen({super.key});
  static String routeName = 'EventScreen';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Up Coming Events'),
      ),
      body: ListView.builder(
        itemCount: eventsData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: kDefaultPadding / 2,
                  right: kDefaultPadding / 2,
                  top: kDefaultPadding / 2,
                  bottom: kDefaultPadding / 2,
                ),
                padding: EdgeInsets.all(kDefaultPadding / 1),
                decoration: BoxDecoration(
                  color: kOtherColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 2),
                    topRight: Radius.circular(kDefaultPadding * 2),
                    bottomRight: Radius.circular(kDefaultPadding * 2),
                    bottomLeft: Radius.circular(kDefaultPadding * 2),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: kDefaultPadding / 2,

                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              eventsData[index].eventType,
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              ),
                            ),
                            Text(
                              eventsData[index].description,
                              style: TextStyle(
                                color: kTextBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                            Text(
                              eventsData[index].time,
                              style: TextStyle(
                                color: kTextBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                            Text(
                              eventsData[index].date,
                              style: TextStyle(
                                color: kTextBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),

                            Text(
                              eventsData[index].superVisor,
                              style: TextStyle(
                                color: kTextBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                            Text(
                              eventsData[index].place,
                              style: TextStyle(
                                color: kTextBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0),
            ],
          );
        },
      ),
    );
  }
}
