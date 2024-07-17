import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/constant.dart';
import 'package:school_app/models/StuProfModel.dart';
import 'package:school_app/blocs/stuProf_bloc.dart';
import 'package:school_app/data_enum/state_types.dart';

import '../../repositories/stuProf_repository.dart';

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
              ),
            ),
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => StuProfBloc(repository: StuProfRepository())
          ..add(FetchStudentsItemsByStudentId(StudentId: 4)), // Replace with the actual student ID
        child: BlocBuilder<StuProfBloc, StuProfState>(
          builder: (context, state) {
            if (state.currentState == StateTypes.loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.currentState == StateTypes.loaded) {
              final student = state.items.isNotEmpty ? state.items.first : null;
              if (student == null) {
                return Center(child: Text("No data found"));
              }
              return Container(
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
                          // CircleAvatar(
                          //   maxRadius: 50.0,
                          //   minRadius: 50.0,
                          //   backgroundColor: kSecondaryColor,
                          //   backgroundImage: student.stuImage != null && File(student.stuImage!).existsSync()
                          //       ? FileImage(File(student.stuImage!))
                          //       : null,
                          //   child: student.stuImage == null
                          //       ? Icon(Icons.person, size: 50)
                          //       : null,
                          // ),
                          kWidthSizedBox,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                student.studentName ?? 'Unknown',
                                style: Theme.of(context).textTheme.bodyLarge,
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
                        // Text(
                        //   student.studentAge ?? 'Unknown',
                        //   style: Theme.of(context).textTheme.bodyLarge,
                        // ),
                        Text(
                          student.levelName ?? 'Unknown',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ProfileDetail(title: 'Class', value:  student.className ?? 'Unknown'),
                        ProfileDetail(title: 'Session', value: '1'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ProfileDetail(title: 'Age', value: student.studentAge ?? 'Unknown'),
                        ProfileDetail(title: 'Level', value: student.levelName ?? 'Unknown'),
                      ],
                    ),
                  ],
                ),
              );
            } else if (state.currentState == StateTypes.error) {
              return Center(child: Text("Error: ${state.error}"));
            } else {
              return Center(child: Text("Unknown state"));
            }
          },
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
            ],
          ),
        ],
      ),
    );
  }
}