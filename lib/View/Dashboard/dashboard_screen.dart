import 'package:easyrishta/common/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../common/app_colors.dart';
import '../../common/app_image.dart';

class DasboardScreen extends StatefulWidget {
  const DasboardScreen({super.key});

  @override
  State<DasboardScreen> createState() => _DasboardScreenState();
}

class _DasboardScreenState extends State<DasboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image.asset(
        AppImages.background,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
      Column(
        children: [
          SizedBox(height: 40.h),
          // Spacer for top margin
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Text(
                  'Home',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.BlackColor, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'notification');
                    },
                    icon: const Icon(
                      Icons.notifications_on,
                      color: AppColors.actionbut,
                    ))
              ],
            ),
          ),
          Image.asset(
            AppImages.logo,
            width: 270.w,
            height: 270.h,
          ),
          Image.asset(
            AppImages.dashboardimage,
            width: 374.w,
            height: 212.h,
          ),
          Wrap(
            spacing: 20.0,
            runSpacing: 16.0,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'matching');
                },
                child: SvgPicture.asset(
                  AppSvgImages.matches,
                  width: 100.0.w,
                  height: 100.0.h,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'allprofile');
                },
                child: SvgPicture.asset(
                  AppSvgImages.otherprofile,
                  width: 100.0.w,
                  height: 100.0.h,
                ),
              ),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  AppSvgImages.phone,
                  width: 100.0.w,
                  height: 100.0.h,
                ),
              ),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  AppSvgImages.whatapp,
                  width: 100.0.w,
                  height: 100.0.h,
                ),
              ),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  AppSvgImages.search,
                  width: 100.0.w,
                  height: 100.0.h,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'chatroom');
                },
                child: SvgPicture.asset(
                  AppSvgImages.onlinechat,
                  width: 100.0.w,
                  height: 100.0.h,
                ),
              ),
            ],
          )
        ],
      ),
    ]));
  }
}
