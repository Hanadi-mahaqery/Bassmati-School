import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';

class StudentName extends StatelessWidget {
  const StudentName({super.key, required this.studentName});
  final String studentName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Hi  ',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w400, color: Colors.white),
        ),
        Text(
          studentName,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
        )
      ],
    );
  }
}

class StudentClass extends StatelessWidget {
  const StudentClass({super.key, required this.studentClass});
  final String studentClass;

  @override
  Widget build(BuildContext context) {
    return Text(
      studentClass,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 14.0,
          ),
    );
  }
}
class StudentYear extends StatelessWidget {
  const StudentYear({super.key, required this.studentYear});
  final String studentYear;

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 100,
      height: 20,
      decoration: BoxDecoration(
          color: kOtherColor,
          borderRadius:
          BorderRadius.circular(kDefaultPadding)),
      child: Center(
        child: Text(
          studentYear,
          style: TextStyle(
              fontSize: 12.0,
              color: kTextBlackColor,
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
class StudentPicture extends StatelessWidget {
  const StudentPicture({super.key, required this.pictureAddress, required this.onPress});
final String pictureAddress;
 final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap:onPress,
      child: CircleAvatar(
        minRadius: 50.0,
        maxRadius: 50.0,
        backgroundColor: kSecondaryColor,
        backgroundImage: AssetImage(pictureAddress),
      ),
    );
  }
}

class StudentDataCard extends StatelessWidget {
  const StudentDataCard({super.key, required this.title,  required this.onPress});
final String title;
//final String value;
final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 9,
        decoration: BoxDecoration(
          color: kOtherColor,
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(
                fontSize: 16.0,
                color: kTextBlackColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            // Text(
            // //  value,
            //   style: Theme.of(context)
            //       .textTheme
            //       .bodyMedium!
            //       .copyWith(
            //     fontSize: 30.0,
            //     color: kTextBlackColor,
            //     fontWeight: FontWeight.w300,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
