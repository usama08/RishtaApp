import 'package:easyrishta/View/Dashboard/widgets/container.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/app_image.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: AppColors.BlackColor,
              fontFamily: 'Poppins-Bold',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.BlackColor,
            size: 32,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            AppImages.background, // Replace with your background image
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 378.w,
                  height: 78.h,
                  padding: const EdgeInsets.all(8),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      // Left side image
                      Container(
                        width: 80.w,
                        height: 80.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(AppImages.infodemo),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      // Right side text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Pearl Chatra ',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      color: AppColors.BlackColor,
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              'Fashion Designer.',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 600.h,
                  decoration: const BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        infoDetail(context, "Name :", "Pearl Chatra"),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Marital Status :", "Single"),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Mother Tongue :", "Urdu"),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Total Children :", "15"),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Children Status :", "Marrried"),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Height :", "N/A"),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Weight :", "N/A"),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Birthday :", "25/05/2000"),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Complexion :", "Urdu"),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Religion :", "Islam"),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Caste :", "N/A"),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Country :", "N/A"),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
