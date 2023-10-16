import 'package:easyrishta/View/auth/widgets/common_buttons.dart';
import 'package:easyrishta/View/auth/pinscreen/phone_screen.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final CountDownController _controller = CountDownController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: AppColors.actionbut,
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.actionbut, width: 2),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromARGB(255, 217, 243, 214),
      ),
    );
    var code = '';
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.background, // Replace with your background image
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40.h),
                Image.asset(
                  'assets/images/logo.png',
                  width: 316.w,
                  height: 316.h,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Verification Code",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: AppColors.BlackColor,
                                  fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Pinput(
                          length: 6,
                          onChanged: (value) {
                            code = value;
                          },
                          // defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: focusedPinTheme,
                          submittedPinTheme: submittedPinTheme,
                          showCursor: true,
                          onCompleted: (pin) => print(pin),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularCountDownTimer(
                              textStyle:
                                  const TextStyle(color: Colors.transparent),
                              duration: 20,
                              width: 120.w,
                              height: 120.h,
                              ringColor: Colors.grey,
                              fillColor: AppColors.actionbut,
                              strokeWidth: 5,
                              controller: _controller,
                              isReverse: true,
                              onComplete: () {
                                print("Countdown completed");
                              },
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Waiting for",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          color: AppColors.BlackColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20),
                                ),
                                Text(
                                  "code",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          color: AppColors.BlackColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Resend",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      color: AppColors.BlackColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20),
                            )),
                        submittButton(
                          context,
                          double.infinity,
                          45.h,
                          AppColors.actionbut,
                          () async {
                            try {
                              PhoneAuthCredential credential =
                                  PhoneAuthProvider.credential(
                                      verificationId: MyPhone.verify,
                                      smsCode: code);

                              // Sign the user in (or link) with the credential
                              await auth.signInWithCredential(credential);
                              // ignore: use_build_context_synchronously
                              Navigator.pushNamedAndRemoveUntil(
                                  context, 'login', (route) => false);
                            } catch (e) {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: AppColors.redColor,
                                  content: Text('Wrong OPT*'),
                                ),
                              );
                            }

                            // Navigator.pushNamed(context, 'login');
                          },
                          "Submit",
                          AppColors.whiteColor,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
