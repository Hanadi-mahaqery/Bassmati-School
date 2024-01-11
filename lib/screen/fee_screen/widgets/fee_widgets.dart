import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';

class FeeButton extends StatelessWidget {
  const FeeButton(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onPress});
  final String title;
  final IconData iconData;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 40.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [kSecondaryColor, kPrimaryColor],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.5, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(kDefaultPadding),
                bottomLeft: Radius.circular(kDefaultPadding))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
            ),
            Icon(
              iconData,
              color: kOtherColor,
              size: 30.0,
            )
          ],
        ),
      ),
    );
  }
}

class FeeDetailRow extends StatelessWidget {
  const FeeDetailRow(
      {super.key, required this.title, required this.statueValue});
  final String title;
  final String statueValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 14.0,
                color: kTextLightColor,
              ),
        ),
        Text(
          statueValue,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14.0,
              color: kTextBlackColor,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
