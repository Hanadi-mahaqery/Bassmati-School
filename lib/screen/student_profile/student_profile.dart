import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});
  static String routeName = 'StudentProfile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(right: kDefaultPadding / 2),
              child: Row(
                children: [
                  Icon(Icons.report_gmailerrorred_outlined),
                  kHalfWidthSizedBox,
                  Text(
                    'Report',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],

                //
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: kOtherColor,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(kDefaultPadding * 2),
                  bottomLeft: Radius.circular(kDefaultPadding * 2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 50.0,
                    minRadius: 50.0,
                    backgroundColor: kSecondaryColor,
                    backgroundImage: AssetImage('assets/images/kid.jpg'),
                  ),
                  kWidthSizedBox,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fatima Mohammed',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'Level 3 Class A',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 14.0,
                            ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileDetail(
                    title: 'Registration Number', value: '2023-019988'),
                ProfileDetail(title: 'Academic Year ', value: '2023-2024'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileDetail(title: 'Admission Class', value: 'Class A'),
                ProfileDetail(title: 'Admission Number ', value: '000231'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileDetail(title: 'Date of Admission', value: '3-July-2020'),
                ProfileDetail(title: 'Date of Birth', value: '15-may-2018'),
              ],
            ),
            ProfileDetailColumn(title: 'Email', value: 'Fatima.mo@gmail.com'),
            ProfileDetailColumn(title: 'Father Name', value: 'Mohammed Ali'),
            ProfileDetailColumn(title: 'Mother Name', value: 'Aysha Bassam'),
            ProfileDetailColumn(title: 'Phone Number', value: '00976775718371'),
          ],
        ),
      ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          right: kDefaultPadding / 4,
          left: kDefaultPadding / 4,
          top: kDefaultPadding / 2),
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(

                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 20.0,
                        color: kTextBlackColor),
                  ),
                  kHalfSizedBox,
                  Text(
                    value,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                        color: kTextBlackColor),
                  ),
                  kHalfSizedBox,
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Divider(
                      thickness: 1.0,
                    ),
                  )
                ],
              ),
             // Icon(Icons.lock_outline, size: 20.0),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileDetailColumn extends StatelessWidget {
  const ProfileDetailColumn(
      {super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: kTextLightColor,
                      fontSize: 15.0,
                    ),
              ),
              kHalfSizedBox,
              Text(
                value,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: kTextBlackColor,
                      fontSize: 15.0,
                    ),
              ),
              kHalfSizedBox,
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Divider(
                  thickness: 1.0,
                ),
              )
            ],
          ),
          Icon(
            Icons.lock_outline,
            size: 20.0,
          )
        ],
      ),
    );
  }
}
