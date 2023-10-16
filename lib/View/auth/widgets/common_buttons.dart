import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget actionButton(BuildContext context, color, gender, color2) {
  return Container(
    width: 140.w,
    height: 50.h,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Text(
      gender,
      style: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(color: color2, fontWeight: FontWeight.normal),
    ),
  );
}

// ignore: non_constant_identifier_names
////////////////////// ---------------  FinalButton  -------------------- //////////////
Widget submittButton(BuildContext context, width, height, color,
    Function() onpress, presstext, textcolor) {
  return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onpress,
        // Navigator.pushNamed(context, 'verify');

        child: Text(presstext,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: textcolor, fontSize: 20, fontWeight: FontWeight.normal)),
      ));
}
