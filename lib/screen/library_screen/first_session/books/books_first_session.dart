import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/screen/library_screen/first_session/books/books_data.dart';
import 'package:school_app/screen/library_screen/first_session/books/pdfs/Math_pdf.dart';

class BooksFirstSession extends StatelessWidget {
  const BooksFirstSession({super.key});
  static String routName = 'BooksFirstSession';

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
                      Navigator.pushNamed(context, MathPdfContentScreen.routeName);
                    }) ,
                  /*  LibType(title: 'Islamic', icon:'assets/icons/library.png', onPress:(){
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
*/
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





/*

class BooksFirstSession extends StatelessWidget {
  const BooksFirstSession({super.key});
  static String routeName = 'BooksFirstSession';

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
*/
