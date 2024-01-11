import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/routes.dart';
import 'package:school_app/screen/all_sign/all_sign.dart';
import 'package:school_app/screen/login_screen/login_screen.dart';
import 'package:school_app/screen/all_sign/all_sign.dart';

class SplashScreen extends StatelessWidget {
  //route name for our screen
  static String routeName = 'SplashScreen';
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      //no return when user is on login screen and press back
      Navigator.pushNamedAndRemoveUntil(
          context, AllSign.routName, (route) => false);
    });
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bassmati',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: kTextWhiteColor,
                        fontSize: 50.0,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 2.0,
                      ),
                ),
                Text(
                  'School',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: kTextWhiteColor,
                        fontSize: 50.0,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 2.0,
                      ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //Expanded(child: child)
                Image.asset('assets/images/boy.png', height: 150, width: 150)
              ],
            )
          ],
        ),
      ),
    );
  }
}
