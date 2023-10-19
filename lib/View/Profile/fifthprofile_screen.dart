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
  bool isLoading = false;
  List<String> heights = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int feet = 4; feet <= 7; feet++) {
      for (int inches = 0; inches < 12; inches++) {
        heights.add('$feet ft $inches in');
      }
    }
    controllerProfile.height = heights[0];
  }

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
                  heights.isNotEmpty
                      ? CustomDropdown(
                          onchangedF: (String? newValue) {
                            setState(() {
                              controllerProfile.height = newValue!;
                              print("Value: ${newValue}");
                            });
                          },
                          selectedValue: controllerProfile.height.toString(),
                          values: heights,
                          labels: heights,
                        )
                      : CircularProgressIndicator(),
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
                      "40kg +",
                      "50kg +",
                      "60kg +",
                      "70kg +",
                      "80kg +",
                      "90kg +",
                      "100kg +",
                      "110kg +",
                    ],
                    labels: const [
                      "Weight *",
                      "40kg +",
                      "50kg +",
                      "60kg +",
                      "70kg +",
                      "80kg +",
                      "90kg +",
                      "100kg +",
                      "110kg +",
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
                      "Meal Timing",
                      "Portion Control",
                      "Balanced Diet",
                      "Snacking",
                      "Mindful Eating",
                      "Eating Speed",
                      "Emotional Eating",
                      "Food Choices",
                      "Hydration",
                      "Eating Out",
                      "Meal Preparation",
                      "Food Addictions",
                    ],
                    labels: const [
                      "Eating Habits *",
                      "Meal Timing",
                      "Portion Control",
                      "Balanced Diet",
                      "Snacking",
                      "Mindful Eating",
                      "Eating Speed",
                      "Emotional Eating",
                      "Food Choices",
                      "Hydration",
                      "Eating Out",
                      "Meal Preparation",
                      "Food Addictions",
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
                      "yes",
                      "No",
                    ],
                    labels: const [
                      "Smoking *",
                      "yes",
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
                      "yes",
                      "No",
                    ],
                    labels: const [
                      "Drinking *",
                      "yes",
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
                      "Ectomorph",
                      "Mesomorph",
                      "Endomorph",
                    ],
                    labels: const [
                      "Body Type *",
                      "Ectomorph",
                      "Mesomorph",
                      "Endomorph",
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
                      "Fair",
                      "Light",
                      "Medium",
                      "Olive",
                      "Tan",
                      "Deep",
                      "Dark",
                      "Ebony",
                    ],
                    labels: const [
                      "Skin Tone *",
                      "Fair",
                      "Light",
                      "Medium",
                      "Olive",
                      "Tan",
                      "Deep",
                      "Dark",
                      "Ebony",
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
                      if (controllerProfile.height.toString().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Your Height is Empty*'),
                          ),
                        );
                      } else if (controllerProfile.weight.toString().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Your Weight is Empty*'),
                          ),
                        );
                      } else if (controllerProfile.habits.toString().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Your Habits is Empty*'),
                          ),
                        );
                      } else if (controllerProfile.smoking.toString().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Your Smoking Field is Empty*'),
                          ),
                        );
                      } else if (controllerProfile.drinking
                          .toString()
                          .isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Your Drinking Field is Empty*'),
                          ),
                        );
                      } else if (controllerProfile.bodytype
                          .toString()
                          .isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Your Body Type Field is Empty*'),
                          ),
                        );
                      } else if (controllerProfile.skintone
                          .toString()
                          .isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Your Skin Tone Field is Empty*'),
                          ),
                        );
                      } else {
                        refresh();
                        String userId = FirebaseAuth.instance.currentUser!.uid;
                        controllerProfile.updateUserDatastep4(userId);
                        Navigator.pushNamed(context, 'sixthbuildprofile');
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
