import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/library_screen/first_session/books/books_data.dart';

class FirstSession extends StatelessWidget {
  const FirstSession({super.key});
  static String routeName = 'FirstSession';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 3 Books'),
      ),
      body: ListView.builder(
        itemCount: booksData.length,
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Image.asset(
                              booksData[index].image,
                              height: 80.0,
                              width: 80.0,
                            ),
                            Text(
                              booksData[index].subjectName,
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
