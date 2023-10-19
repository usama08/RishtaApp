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
                      if (controllerProfile.hobby.toString().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Your hobby is Empty*'),
                          ),
                        );
                      } else if (controllerProfile.aboutyourfelf.text
                          .trim()
                          .isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Your field is Empty*'),
                          ),
                        );
                      } else {
                        refresh();
                        String userId = FirebaseAuth.instance.currentUser!.uid;
                        controllerProfile.updateUserDatastep5(userId);
                        Navigator.pushNamed(context, 'addimageprofile');
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
