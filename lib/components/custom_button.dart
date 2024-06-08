import 'package:flutter/material.dart';
import 'package:school_app/constant.dart';


class DefualtButton extends StatelessWidget {
  final VoidCallback onpress;
  final String title;
  final IconData iconData;



  const DefualtButton({super.key, required this.onpress, required this.title, required this.iconData});@override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        margin: EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding
        ),
        padding: EdgeInsets.only(right: kDefaultPadding),
        width: double.infinity,
        height: 40.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [kSecondaryColor ,kPrimaryColor],
                begin: const FractionalOffset(0.0, 0.5),
                end: const FractionalOffset(0.5, 0.0),
                stops: [0.0,1.0],
                tileMode: TileMode.clamp
            ),
            borderRadius: BorderRadius.circular(kDefaultPadding)
        ),
        child:

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[

            Spacer(),
            Text(title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 30.0,
                color: kOtherColor
            ),),
            Spacer(),
            Icon(iconData,
              size: 30.0,
              color: kOtherColor,
            )
          ],
        ),
      ),
    );
  }
}
