import 'package:easyrishta/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget infoDetail(BuildContext context, name, response) {
  return Container(
    width: 370.w,
    height: 50,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.BlackColor, width: 0.5)),
    child: Padding(
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            response,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    ),
  );
}
