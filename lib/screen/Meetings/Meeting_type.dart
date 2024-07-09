import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/Meetings/PreMeetingScreen.dart';
import 'package:school_app/screen/Meetings/inCome_meetings_screen.dart';


class MeetingTypeScreen extends StatelessWidget {
  const MeetingTypeScreen({super.key});
  static String routeName = 'MeetingTypeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meetings'),
      ),

      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height /3.0,
            child: Column(
              children: [
                //   Image.asset('assets/images/boy.png',height: 150.0,width: 150.0,),
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
                SizedBox(
                  height: kDefaultPadding,
                ),
                /*  Text(
                  'Sign in to continue',
                  style: Theme.of(context).textTheme.bodySmall,
                )*/
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
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SessionNumber(title: 'In Coming Meeting', onPress:(){
                      Navigator.pushNamed(context, InComeMeetingScreen.routeName);
                    }) ,
                    SessionNumber(title: 'Previous Meetings', onPress:(){
                      Navigator.pushNamed(context, PreMeetingScreen.routeName);
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


class SessionNumber extends StatelessWidget {
  const SessionNumber({super.key, required this.title, required this.onPress});
  final String title;
  final VoidCallback onPress;


  @override
  Widget build(BuildContext context) {
    return InkWell(

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
            // Image.asset(icon, height: 40.0, width: 40.0, color: kOtherColor),
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
    );;
  }
}
