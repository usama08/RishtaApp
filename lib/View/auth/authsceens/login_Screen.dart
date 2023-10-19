import 'package:easyrishta/View/auth/controller/auth_controller.dart';
import 'package:easyrishta/View/auth/widgets/textpressbutton.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../widgets/common_buttons.dart';
import '../widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var profilecontroller = Get.put(SignupController());

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
                SizedBox(height: 40.h),
                Image.asset(
                  'assets/images/logo.png',
                  width: 316.w,
                  height: 316.h,
                ),
                // Spacer for top margin
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
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
                            TextInputType.text,
                            profilecontroller.loginemail,
                            'Email *',
                            false,
                            null,
                            null),
                        SizedBox(
                          height: 15.h,
                        ),
                        customtextfield(
                          context,
                          TextInputType.text,
                          profilecontroller.passworrd,
                          'Password *',
                          true,
                          null,
                          Icons.remove_red_eye,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'forgetpassword');
                      },
                      child: Text(
                        "Forget Password?",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                color: AppColors.actionbut,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),

                submittButton(
                  context,
                  double.infinity,
                  45.h,
                  AppColors.actionbut,
                  () {
                    if (profilecontroller.loginemail.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Your Email is Empty*'),
                        ),
                      );
                    } else if (profilecontroller.passworrd.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Your Password is Empty*'),
                        ),
                      );
                    } else {
                      profilecontroller.signInEmailPassword(context);
                    }
                  },
                  "Login",
                  AppColors.whiteColor,
                ),
                const SizedBox(height: 10.0),

                const SizedBox(height: 10.0),

                accounttext(context, 'New User?', "Sign up", () {
                  Navigator.pushNamed(context, 'signup');
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
