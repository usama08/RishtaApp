import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../auth/widgets/common_buttons.dart';
import '../auth/widgets/dropDown.dart';
import '../auth/widgets/textfield.dart';
import 'controller/profile_controller.dart';

class SixthBuildprofile extends StatefulWidget {
  const SixthBuildprofile({super.key});

  @override
  State<SixthBuildprofile> createState() => _SixthBuildprofileState();
}

class _SixthBuildprofileState extends State<SixthBuildprofile> {
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
                customtextfield(context, TextInputType.text,
                    controllerProfile.subcaste, "Sub Caste", false, null, null),
                SizedBox(
                  height: 10.h,
                ),
                CustomDropdown(
                  onchangedF: (String? newValue) {
                    setState(() {
                      controllerProfile.manglik = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.manglik.toString(),
                  values: const [
                    "Manglik",
                    "65kg",
                    "70kg",
                  ],
                  labels: const [
                    "Manglik",
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
                      controllerProfile.star = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.star.toString(),
                  values: const [
                    "Star",
                    "Nothing",
                  ],
                  labels: const [
                    "Star",
                    "Nothing",
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomDropdown(
                  onchangedF: (String? newValue) {
                    setState(() {
                      controllerProfile.horoscope = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.horoscope.toString(),
                  values: const [
                    "Horoscope",
                    "No",
                  ],
                  labels: const [
                    "Horoscope",
                    "No",
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                customtextfield(context, TextInputType.text,
                    controllerProfile.gothra, "Gothra", false, null, null),
                SizedBox(
                  height: 10.h,
                ),

                CustomDropdown(
                  onchangedF: (String? newValue) {
                    setState(() {
                      controllerProfile.moonsign = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.moonsign.toString(),
                  values: const [
                    "Moon Sign",
                    "No",
                  ],
                  labels: const [
                    "Moon Sign",
                    "No",
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                textfield(context, controllerProfile.hobby, "Hobby *"),
                SizedBox(
                  height: 10.h,
                ),
                textfield(context, controllerProfile.aboutyourfelf,
                    "Write About yourself*"),
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
                    controllerProfile.updateUserDatastep5(userId);
                    Navigator.pushNamed(context, 'addimageprofile');
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
