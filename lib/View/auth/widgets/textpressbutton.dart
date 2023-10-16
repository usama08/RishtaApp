import 'package:easyrishta/common/app_colors.dart';
import 'package:flutter/material.dart';

//////////   textwidget  /////////////////
Widget accounttext(BuildContext context, text1, text2, Function() onpress) {
  return GestureDetector(
    onTap: onpress,
    child: RichText(
      text: TextSpan(
        text: text1,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: AppColors.bottomNavigationbg,
            fontSize: 20,
            fontWeight: FontWeight.normal), // Color for the first part
        children: <TextSpan>[
          const TextSpan(text: " "),
          TextSpan(
            text: text2,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: AppColors.actionbut,
                fontSize: 20,
                fontWeight: FontWeight.normal), // Color for the second part
            // You can add more style properties here if needed
          ),
        ],
      ),
    ),
  );
}
