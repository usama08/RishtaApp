import 'package:easyrishta/View/Dashboard/widgets/container.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:easyrishta/models/info_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MatchesProfiledetails extends StatefulWidget {
  final UserInfoData match;

  MatchesProfiledetails({required this.match});

  @override
  State<MatchesProfiledetails> createState() => _MatchesProfiledetailsState();
}

class _MatchesProfiledetailsState extends State<MatchesProfiledetails> {
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
                  height: 85.h,
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
                      widget.match.imagePath.isEmpty
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
                                  image: NetworkImage(widget.match.imagePath),
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
                              widget.match.firstname,
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
                              widget.match.designation,
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
                          widget.match.firstname,
                        ),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Marital Status :",
                            widget.match.maritalStatus),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Mother Tongue :",
                            widget.match.motherTongue),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Total Children :",
                            widget.match.totalChildren),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Children Status :",
                            widget.match.statusChildren),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Height :", widget.match.height),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Weight :", widget.match.weight),
                        SizedBox(height: 5.h),
                        infoDetail(
                            context, "Birthday :", widget.match.dateOfBirth),
                        SizedBox(height: 5.h),
                        infoDetail(
                            context, "Complexion :", widget.match.skinTone),
                        SizedBox(height: 5.h),
                        infoDetail(
                            context, "Religion :", widget.match.religion),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Caste :", widget.match.caste),
                        SizedBox(height: 5.h),
                        infoDetail(context, "Country :", widget.match.country),
                        SizedBox(height: 10.h),
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
