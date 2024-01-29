import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/exam_schedule/data/exam_data.dart';
import 'package:school_app/screen/library_screen/first_session/videos/data/content_data.dart';

class QuranContentScreen extends StatelessWidget {
  const QuranContentScreen({super.key});
  static const String routeName ='QuranContentScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('َQuran'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: kOtherColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(kDefaultPadding),
                topLeft: Radius.circular(kDefaultPadding)
            )
        ),
        child: ListView.builder(
            itemCount: examSchedule.length,
            itemBuilder: (context,index){
              return Container(


                margin: EdgeInsets.only(left: kDefaultPadding/2,
                    right: kDefaultPadding/2),
                padding: EdgeInsets.all(kDefaultPadding /2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: kDefaultPadding,
                      child: Divider(
                        thickness: 1.0,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(contentData[index].lessonName,
                              style: TextStyle(
                                  color: kTextBlackColor,
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.bold
                              ),),

                            Text(contentData[index].link,
                              style: TextStyle(
                                color: kTextBlackColor,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w300,
                              ),),
                          ],
                        ),
                       /* Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(examSchedule[index].subjectName,
                              style: TextStyle(
                                  color: kTextBlackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0
                              ),),
                            Text(examSchedule[index].dayName,
                              style: TextStyle(
                                  color: kTextBlackColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13.0
                              ),)
                          ],
                        ),*/
                       /* Column(
                          children: [
                            Text(examSchedule[index].time,
                              style: TextStyle(
                                color: kTextLightColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 13.0,
                              ) ,)
                          ],
                        )*/
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
