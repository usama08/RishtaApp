import 'package:easyrishta/View/auth/controller/auth_controller.dart';
import 'package:easyrishta/View/auth/widgets/textpressbutton.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../widgets/common_buttons.dart';
import '../widgets/textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var controller = Get.put(SignupController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isMalePressed = false;
  bool isFemalePressed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
              children: [
                const SizedBox(height: 100.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Sign Up',
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: AppColors.BlackColor,
                                fontWeight: FontWeight.bold,
                              ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Wrap(
                  spacing: 30,
                  runSpacing: 10,
                  children: [
                    InkWell(
                      mouseCursor: SystemMouseCursors.click,
                      onTap: () {
                        setState(() {
                          isMalePressed = !isMalePressed;
                          isFemalePressed = false;
                          if (isMalePressed) {
                            controller.genderis = "Male";
                          } else {
                            controller.genderis = "";
                          }
                        });
                      },
                      child: actionButton(
                        context,
                        isMalePressed
                            ? AppColors.actionbut
                            : AppColors.whiteColor,
                        "Male",
                        isMalePressed
                            ? AppColors.whiteColor
                            : AppColors.BlackColor,
                      ),
                    ),
                    InkWell(
                      mouseCursor: SystemMouseCursors.click,
                      onTap: () {
                        setState(() {
                          isFemalePressed = !isFemalePressed;
                          isMalePressed = false;
                          if (isFemalePressed) {
                            controller.genderis = "Female";
                          } else {
                            controller.genderis = "";
                          }
                        });
                      },
                      child: actionButton(
                        context,
                        isFemalePressed
                            ? AppColors.actionbut
                            : AppColors.whiteColor,
                        "Female",
                        isFemalePressed
                            ? AppColors.whiteColor
                            : AppColors.BlackColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
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
                            controller.firstname,
                            'First Name *',
                            false,
                            null,
                            null),
                        SizedBox(
                          height: 15.h,
                        ),
                        customtextfield(
                            context,
                            TextInputType.text,
                            controller.lastname,
                            'Last Name *',
                            false,
                            null,
                            null),
                        SizedBox(
                          height: 15.h,
                        ),
                        customtextfield(context, TextInputType.text,
                            controller.email, 'Email *', false, null, null),
                        SizedBox(
                          height: 15.h,
                        ),
                        customtextfield(
                          context,
                          TextInputType.text,
                          controller.password,
                          'Password *',
                          true,
                          null,
                          Icons.remove_red_eye,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 40,
                                child: TextField(
                                  controller: controller.countryController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const Text(
                                "|",
                                style:
                                    TextStyle(fontSize: 33, color: Colors.grey),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: controller.phoneno,
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Phone",
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                submittButton(
                  context,
                  double.infinity,
                  45.h,
                  AppColors.actionbut,
                  () {
                    if (controller.firstname.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Your First Name is Empty*'),
                        ),
                      );
                    } else if (controller.lastname.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Your Last Name is Empty*'),
                        ),
                      );
                    } else if (controller.email.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Your Email Name is Empty*'),
                        ),
                      );
                    } else if (controller.password.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Your Password Name is Empty*'),
                        ),
                      );
                    } else if (controller.phoneno.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Your Phone No. Name is Empty*'),
                        ),
                      );
                    } else {
                      Navigator.pushNamed(context, 'phone');
                      // controller.registerEmailPassword(context);
                    }
                  },
                  "SignUp with OPT",
                  AppColors.whiteColor,
                ),
                const SizedBox(height: 10.0),
                Text(
                  "or",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: AppColors.bottomNavigationbg,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                const SizedBox(height: 10.0),
                accounttext(context, 'Already a Member?', "Log in", () {
                  Navigator.pushNamed(context, 'login');
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
