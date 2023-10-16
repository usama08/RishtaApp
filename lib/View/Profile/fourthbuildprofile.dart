import 'package:easyrishta/View/Profile/controller/profile_controller.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../auth/widgets/common_buttons.dart';
import '../auth/widgets/dropDown.dart';

class FourthBuildprofile extends StatefulWidget {
  const FourthBuildprofile({super.key});

  @override
  State<FourthBuildprofile> createState() => _FourthBuildprofileState();
}

class _FourthBuildprofileState extends State<FourthBuildprofile> {
  var controllerProfile = Get.put(PofileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            AppImages.background, // Replace with your background image
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Sign-up form
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                // Spacer for top margin
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Build Profile',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              color: AppColors.BlackColor,
                              fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomDropdown(
                  onchangedF: (String? newValue) {
                    setState(() {
                      controllerProfile.qualification = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.qualification.toString(),
                  values: const [
                    "Education*",
                    "Bachelor",
                  ],
                  labels: const [
                    "Education*",
                    "Bachelor",
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomDropdown(
                  onchangedF: (String? newValue) {
                    setState(() {
                      controllerProfile.income = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.income.toString(),
                  values: const [
                    "Employee in",
                    "40k+",
                    "80k+",
                  ],
                  labels: const [
                    "Employee in",
                    "40k+",
                    "80k+",
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomDropdown(
                  onchangedF: (String? newValue) {
                    setState(() {
                      controllerProfile.occupation = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.occupation.toString(),
                  values: const [
                    "Occupation",
                    "It",
                  ],
                  labels: const [
                    "Occupation",
                    "It",
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomDropdown(
                  onchangedF: (String? newValue) {
                    setState(() {
                      controllerProfile.designation = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.designation.toString(),
                  values: const [
                    "Designation",
                    "Software Developer",
                  ],
                  labels: const [
                    "Designation",
                    "Software Developer",
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                submittButton(
                  context,
                  double.infinity,
                  45.h,
                  AppColors.actionbut,
                  () {
                    String userId = FirebaseAuth.instance.currentUser!.uid;
                    controllerProfile.updateUserDatastep3(userId);
                    Navigator.pushNamed(context, 'fourthbuildprofile');
                    Navigator.pushNamed(context, 'fifthbuildprofile');
                  },
                  "Continue",
                  AppColors.whiteColor,
                ),
                SizedBox(
                  height: 15.h,
                ),
                submittButton(
                  context,
                  double.infinity,
                  45.h,
                  AppColors.whiteColor,
                  () {
                    Navigator.pushNamed(context, '');
                  },
                  "Previous",
                  AppColors.BlackColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
