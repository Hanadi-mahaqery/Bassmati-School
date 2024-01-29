import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/login_screen/login_screen.dart';
import 'package:school_app/screen/parent_login/parent_log.dart';
import 'package:school_app/screen/result_screen/session1/months/result2_screen.dart';
import 'package:school_app/screen/result_screen/session1/months/result3_screen.dart';
import 'package:school_app/screen/result_screen/total_screen/total1_screen.dart';

class MonthsResults extends StatelessWidget {
  const MonthsResults({super.key});
  static String routeName = 'MonthsResults';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Months'),
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
                    MonthNumber(title: 'Month 1', onPress:(){
                      Navigator.pushNamed(context, Result3Screen.routeName);
                    }) ,
                    MonthNumber(title: 'Month 2', onPress:(){
                      Navigator.pushNamed(context, Result2Screen.routeName);
                    }) ,
                    MonthNumber(title: 'Month 3', onPress:(){
                      Navigator.pushNamed(context, Result3Screen.routeName);
                    }),
                    MonthNumber(title: 'Session 1 Total', onPress:(){
                      Navigator.pushNamed(context, Total1Screen.routeName);
                    })

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


class MonthNumber extends StatelessWidget {
  const MonthNumber({super.key, required this.title, required this.onPress});
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
