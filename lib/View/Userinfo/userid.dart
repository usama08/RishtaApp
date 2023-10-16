import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserId extends StatelessWidget {
  final List<String> items = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User ID',
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
          // Background Image
          Image.asset(
            AppImages.background, // Replace with your image asset
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // Content
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return buildListItem(index);
            },
          ),
        ],
      ),
    );
  }

  Widget buildListItem(int index) {
    return Container(
      width: 378.w,
      height: 78.h,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Left side image
          Container(
            width: 60.w,
            height: 40.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AppImages.infodemo),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          // Right side text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'User Name #$index',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  'E4AGJSY%.',
                  style: TextStyle(fontSize: 14.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
