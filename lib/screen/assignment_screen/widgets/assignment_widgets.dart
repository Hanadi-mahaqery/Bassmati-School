import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';

class AssignmentDetailRow extends StatelessWidget {
  final String title;
  final String statusValue;

  const AssignmentDetailRow({
    Key? key,
    required this.title,
    required this.statusValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: kTextLightColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          statusValue,
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
