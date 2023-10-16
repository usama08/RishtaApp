import 'package:easyrishta/View/Profile/controller/profile_controller.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../auth/widgets/common_buttons.dart';
import '../auth/widgets/dropDown.dart';

class FifthBuildprofile extends StatefulWidget {
  const FifthBuildprofile({super.key});

  @override
  State<FifthBuildprofile> createState() => _FifthBuildprofileState();
}

class _FifthBuildprofileState extends State<FifthBuildprofile> {
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
                      controllerProfile.height = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.height.toString(),
                  values: const [
                    "Height *",
                    "4.0",
                  ],
                  labels: const [
                    "Height *",
                    "4.0",
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomDropdown(
                  onchangedF: (String? newValue) {
                    setState(() {
                      controllerProfile.weight = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.weight,
                  values: const [
                    "Weight *",
                    "65kg",
                    "70kg",
                  ],
                  labels: const [
                    "Weight *",
                    "65kg",
                    "70kg",
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomDropdown(
                  onchangedF: (String? newValue) {
                    setState(() {
                      controllerProfile.habits = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.habits.toString(),
                  values: const [
                    "Eating Habits *",
                    "Nothing",
                  ],
                  labels: const [
                    "Eating Habits *",
                    "Nothing",
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomDropdown(
                  onchangedF: (String? newValue) {
                    setState(() {
                      controllerProfile.smoking = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.smoking.toString(),
                  values: const [
                    "Smoking *",
                    "No",
                  ],
                  labels: const [
                    "Smoking *",
                    "No",
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomDropdown(
                  onchangedF: (String? newValue) {
                    setState(() {
                      controllerProfile.drinking = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.drinking.toString(),
                  values: const [
                    "Drinking *",
                    "No",
                  ],
                  labels: const [
                    "Drinking *",
                    "No",
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomDropdown(
                  onchangedF: (String? newValue) {
                    setState(() {
                      controllerProfile.bodytype = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.bodytype.toString(),
                  values: const [
                    "Body Type *",
                    "No",
                  ],
                  labels: const [
                    "Body Type *",
                    "No",
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomDropdown(
                  onchangedF: (String? newValue) {
                    setState(() {
                      controllerProfile.skintone = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.skintone.toString(),
                  values: const [
                    "Skin Tone *",
                    "No",
                  ],
                  labels: const [
                    "Skin Tone *",
                    "No",
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
                    controllerProfile.updateUserDatastep4(userId);
                    Navigator.pushNamed(context, 'sixthbuildprofile');
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
