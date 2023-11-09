import 'package:easyrishta/View/Dashboard/controller/get_data.dart';
import 'package:easyrishta/View/Dashboard/widgets/container.dart';
import 'package:easyrishta/View/auth/widgets/common_buttons.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:easyrishta/models/info_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsVerificationScreen extends StatefulWidget {
  const DetailsVerificationScreen({Key? key}) : super(key: key);

  @override
  State<DetailsVerificationScreen> createState() =>
      _DetailsVerificationScreenState();
}

class _DetailsVerificationScreenState extends State<DetailsVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verify Profile',
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
      body: StreamBuilder<List<UserInfoData>>(
        stream: CurrentUSerData().verifydata,
        builder: (context, snapshot) {
          print("response");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            print("response2");
            if (snapshot.data != null && snapshot.data!.isNotEmpty) {
              print("response3");
              UserInfoData userData = snapshot.data![0];

              return Stack(
                children: [
                  Image.asset(
                    AppImages.background,
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
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
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
                                          image:
                                              NetworkImage(userData.imagePath),
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
                                              fontSize: 22,
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
                                infoDetail(context, "Mother Tongue :",
                                    userData.motherTongue),
                                SizedBox(height: 5.h),
                                infoDetail(context, "Total Children :",
                                    userData.totalChildren),
                                SizedBox(height: 5.h),
                                infoDetail(context, "Children Status :",
                                    userData.statusChildren),
                                SizedBox(height: 5.h),
                                infoDetail(
                                    context, "Height :", userData.height),
                                SizedBox(height: 5.h),
                                infoDetail(
                                    context, "Weight :", userData.weight),
                                SizedBox(height: 5.h),
                                infoDetail(context, "Birthday :",
                                    userData.dateOfBirth),
                                SizedBox(height: 5.h),
                                infoDetail(
                                    context, "Complexion :", userData.skinTone),
                                SizedBox(height: 5.h),
                                infoDetail(
                                    context, "Religion :", userData.religion),
                                SizedBox(height: 5.h),
                                infoDetail(context, "Caste :", userData.caste),
                                SizedBox(height: 5.h),
                                infoDetail(
                                    context, "Country :", userData.country),
                                SizedBox(height: 5.h),
                                submittButton(
                                  context,
                                  double.infinity,
                                  45.h,
                                  AppColors.actionbut,
                                  () {
                                    Navigator.pushNamed(context, 'Dashboard');
                                  },
                                  "Submit Information",
                                  const Color.fromRGBO(255, 255, 255, 1),
                                ),
                                SizedBox(height: 10.h),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else {
              return const Center(
                child: Text('User data not found.'),
              );
            }
          }
        },
      ),
    );
  }
}
