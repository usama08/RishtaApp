import 'package:easyrishta/View/Dashboard/widgets/container.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/models/info_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/app_image.dart';

class ProfileInfo extends StatelessWidget {
  final UserInfoData userData;

  const ProfileInfo({required this.userData});

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
                      userData.imagePath.isEmpty
                          ? Container(
                              width: 80.w,
                              height: 80.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(AppImages.infodemo),
                                  fit: BoxFit.cover,
                                ),
                              ))
                          : Container(
                              width: 80.w,
                              height: 80.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(userData.imagePath),
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
                              userData.firstname,
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
                              userData.designation,
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
                        infoDetail(
                          context,
                          "Name :",
                          userData.firstname,
                        ),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Marital Status :",
                            userData.maritalStatus),
                        SizedBox(height: 5.h),
                        infoDetail(
                            context, "Mother Tongue :", userData.motherTongue),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Total Children :",
                            userData.totalChildren),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Children Status :",
                            userData.statusChildren),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Height :", userData.height),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Weight :", userData.weight),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Birthday :", userData.dateOfBirth),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Complexion :", ""),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Religion :", userData.religion),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Caste :", userData.caste),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Country :", userData.country),
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
