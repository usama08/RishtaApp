import 'package:easyrishta/View/Profile/controller/profile_controller.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:easyrishta/extra/dumydata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../auth/widgets/common_buttons.dart';
import '../auth/widgets/dropDown.dart';

class ThirdBuildprofile extends StatefulWidget {
  const ThirdBuildprofile({super.key});

  @override
  State<ThirdBuildprofile> createState() => _ThirdBuildprofileState();
}

class _ThirdBuildprofileState extends State<ThirdBuildprofile> {
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
                  const CountryStateCityPickerScreen(),

                  CustomDropdown(
                    onchangedF: (String? newValue) {
                      setState(() {
                        controllerProfile.maritialstatus = newValue!;
                        print("Value: ${newValue}");
                      });
                    },
                    selectedValue: controllerProfile.maritialstatus.toString(),
                    values: const [
                      "Separated",
                      "yes",
                      "no",
                    ],
                    labels: const [
                      "Separated",
                      "yes",
                      "no",
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomDropdown(
                    onchangedF: (String? newValue) {
                      setState(() {
                        controllerProfile.totalchild = newValue!;
                        print("Value: ${newValue}");
                      });
                    },
                    selectedValue: controllerProfile.totalchild.toString(),
                    values: const [
                      "Total Children",
                      "0",
                      "1",
                      "2",
                      "3",
                      "4",
                      "5"
                    ],
                    labels: const [
                      "Total Children",
                      "0",
                      "1",
                      "2",
                      "3",
                      "4",
                      "5"
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  if (controllerProfile.totalchild.toString() != "0") ...[
                    CustomDropdown(
                      onchangedF: (String? newValue) {
                        setState(() {
                          controllerProfile.statuschild = newValue!;
                          print("Value: ${newValue}");
                        });
                      },
                      selectedValue: controllerProfile.statuschild.toString(),
                      values: const ["Status Children", "Single", "Married"],
                      labels: const ["Status Children", "Single", "Married"],
                    ),
                  ],

                  SizedBox(
                    height: 15.h,
                  ),
                  submittButton(
                    context,
                    double.infinity,
                    45.h,
                    AppColors.actionbut,
                    () {
                      refresh();
                      String userId = FirebaseAuth.instance.currentUser!.uid;
                      controllerProfile.updateUserDatastep2(userId);
                      Navigator.pushNamed(context, 'fourthbuildprofile');
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
                      if (controllerProfile.maritialstatus.toString().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Your Maritialstatus is Empty*'),
                          ),
                        );
                      } else if (controllerProfile.totalchild
                          .toString()
                          .isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Your Total Child is Empty*'),
                          ),
                        );
                      } else if (controllerProfile.statuschild
                          .toString()
                          .isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Your Status Child is Empty*'),
                          ),
                        );
                      } else {
                        Navigator.of(context).pop();
                      }
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
