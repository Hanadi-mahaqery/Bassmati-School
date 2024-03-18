import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/library_screen/first_session/books/books_first_session.dart';
import 'package:school_app/screen/library_screen/first_session/library_type.dart';
import 'package:school_app/screen/library_screen/first_session/videos/content/Arabic.dart';
import 'package:school_app/screen/library_screen/first_session/videos/content/English.dart';
import 'package:school_app/screen/library_screen/first_session/videos/content/Math.dart';
import 'package:school_app/screen/library_screen/first_session/videos/content/Quran.dart';
import 'package:school_app/screen/library_screen/first_session/videos/content/Science.dart';
import 'package:school_app/screen/library_screen/second_session/library_type2.dart';
import 'package:school_app/screen/library_screen/second_session/second_session.dart';
import 'package:school_app/screen/login_screen/login_screen.dart';
import 'package:school_app/screen/parent_login/parent_log.dart';

import 'content/Islamic.dart';

class VideoFirstScreen extends StatelessWidget {
  const VideoFirstScreen({super.key});
  static String routName = 'VideoFirstScreen';

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
                Image.asset('assets/icons/ELibrary.png',height: 150.0,width: 150.0,),
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
                          'Welcome in',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.w200),
                        ),
                        Text('E-Library',
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
                    LibType(title: 'Quran', icon: 'assets/icons/library.png', onPress:(){
                      Navigator.pushNamed(context, QuranContentScreen.routeName);
                    }) ,
                    LibType(title: 'Islamic', icon:'assets/icons/library.png', onPress:(){
                      Navigator.pushNamed(context, IslamicContentScreen.routeName);
                    }) ,
                    LibType(title: 'Arabic', icon:'assets/icons/library.png', onPress:(){
                      Navigator.pushNamed(context, ArabicContentScreen.routeName );
                    }) ,
                    LibType(title: 'Math', icon:'assets/icons/library.png', onPress:(){
                      Navigator.pushNamed(context, MathContentScreen.routeName );
                    }) ,
                    LibType(title: 'English', icon:'assets/icons/library.png', onPress:(){
                      Navigator.pushNamed(context,EnglishContentScreen.routeName );
                    }) ,
                    LibType(title: 'Science', icon:'assets/icons/library.png', onPress:(){
                      Navigator.pushNamed(context,ScienceContentScreen.routeName );
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

class LibType extends StatelessWidget {
  const LibType({super.key, required this.title, required this.icon, required this.onPress});
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
