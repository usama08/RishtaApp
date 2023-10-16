import 'package:easyrishta/View/Profile/controller/profile_controller.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../auth/widgets/common_buttons.dart';
import '../auth/widgets/textfield.dart';

class ProfileBuild extends StatefulWidget {
  const ProfileBuild({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileBuildState createState() => _ProfileBuildState();
}

class _ProfileBuildState extends State<ProfileBuild> {
  var profileController = Get.put(PofileController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

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
                Image.asset(
                  AppImages.logo,
                  width: 270.w,
                  height: 270.h,
                ),
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

                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        customtextfield(
                            context,
                            TextInputType.datetime,
                            profileController.datebirth,
                            'Date of Birth*',
                            false,
                            null,
                            null),
                        SizedBox(
                          height: 15.h,
                        ),
                        customtextfield(
                          context,
                          TextInputType.text,
                          profileController.religion,
                          'Religion *',
                          false,
                          null,
                          null,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        customtextfield(
                          context,
                          TextInputType.text,
                          profileController.caste,
                          'Caste *',
                          false,
                          null,
                          null,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        customtextfield(
                          context,
                          TextInputType.text,
                          profileController.tongue,
                          'Mother Tongue *',
                          false,
                          null,
                          null,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                submittButton(
                  context,
                  double.infinity,
                  45.h,
                  AppColors.actionbut,
                  () {
                    String userId = FirebaseAuth.instance.currentUser!.uid;
                    profileController.updateUserData(userId);

                    Navigator.pushNamed(context, 'thirdbuildprofile');
                  },
                  "Continue",
                  AppColors.whiteColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
