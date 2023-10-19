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
  bool isLoading = false;
  void refresh() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 4));

    setState(() {
      const CircularProgressIndicator(
        color: AppColors.themeColor,
        backgroundColor: AppColors.SecondaryColor,
      );
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.themeColor,
          backgroundColor: AppColors.SecondaryColor,
        ),
      );
    } else {
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
                      "Matric",
                      "intermediate",
                      "Bachelor",
                      "Masters",
                      "PHD"
                    ],
                    labels: const [
                      "Education*",
                      "Matric",
                      "intermediate",
                      "Bachelor",
                      "Masters",
                      "PHD"
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
                      "50,000 +",
                      "100,000 +",
                      "200,000 +",
                      "300,000 +",
                      "400,000 +",
                      "500,000 +",
                    ],
                    labels: const [
                      "Employee in",
                      "50,00 +",
                      "100,000 +",
                      "200,000 +",
                      "300,000 +",
                      "400,000 +",
                      "500,000 +",
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
                      "Enginer",
                      "Doctor",
                      "Lawyer",
                      "Teacher",
                      "Businesman",
                      "CA",
                      "Govt Employer",
                      "Judge",
                      "Journalist",
                      "Other",
                    ],
                    labels: const [
                      "Occupation",
                      "Enginer",
                      "Doctor",
                      "Lawyer",
                      "Teacher",
                      "Businesman",
                      "CA",
                      "Govt Employer",
                      "Judge",
                      "Journalist",
                      "Other",
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
                      "Assistent Manager",
                      "General Manager",
                      "Director",
                      "Other"
                    ],
                    labels: const [
                      "Designation",
                      "Assistent Manager",
                      "General Manager",
                      "Director",
                      "Other"
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
                      if (controllerProfile.qualification.toString().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Your Qualification is Empty*'),
                          ),
                        );
                      } else if (controllerProfile.income.toString().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Your Income is Empty*'),
                          ),
                        );
                      } else if (controllerProfile.occupation
                          .toString()
                          .isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Your Occupation is Empty*'),
                          ),
                        );
                      } else if (controllerProfile.designation
                          .toString()
                          .isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Your Designation is Empty*'),
                          ),
                        );
                      } else {
                        refresh();
                        String userId = FirebaseAuth.instance.currentUser!.uid;
                        controllerProfile.updateUserDatastep3(userId);
                        Navigator.pushNamed(context, 'fourthbuildprofile');
                        Navigator.pushNamed(context, 'fifthbuildprofile');
                      }
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
                      Navigator.of(context).pop();
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
}
