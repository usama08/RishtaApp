import 'package:easyrishta/common/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../common/app_colors.dart';
import '../../common/app_image.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Warning',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: AppColors.redColor)),
            content: Text('Do you want to exit the application?',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 16,
                      color: AppColors.BlackColor,
                    )),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 18,
                          color: AppColors.primaryColor,
                        )),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
                        color: AppColors.BlackColor,
                        fontWeight: FontWeight.bold),
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
                    Navigator.pushNamed(context, 'signup');
                  },
                  child: SvgPicture.asset(
                    AppSvgImages.matches,
                    width: 100.0.w,
                    height: 100.0.h,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'userlist');
                  },
                  child: SvgPicture.asset(
                    AppSvgImages.otherprofile,
                    width: 100.0.w,
                    height: 100.0.h,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'userid');
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
      ])),
    );
  }
}
