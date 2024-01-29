import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/notification_screen/notification_data.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static String routeName = 'NotificationScreen';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Up Coming Notifications'),
      ),
      body: ListView.builder(
        itemCount: notificationsData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: kDefaultPadding / 2,
                  right: kDefaultPadding / 2,
                  top: kDefaultPadding / 2, // ÙØ³Ø§ÙØ© ÙÙ Ø§ÙØ£Ø¹ÙÙ
                  bottom: kDefaultPadding / 2, // ÙØ³Ø§ÙØ© ÙÙ Ø§ÙØ£Ø³ÙÙ
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
                        /*    Image.asset(
                              notificationsData[index].icon,
                              height: 40.0,
                              width: 40.0,
                            ),*/
                            Text(
                              notificationsData[index].notificationType,
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              ),
                            ),
                            Text(
                              notificationsData[index].description,
                              style: TextStyle(
                                color: kTextBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                            Text(
                              notificationsData[index].time,
                              style: TextStyle(
                                color: kTextLightColor,
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
