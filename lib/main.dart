import 'package:easyrishta/View/ChatScreen/chatroom.dart';
import 'package:easyrishta/View/Dashboard/dashboard_screen.dart';
import 'package:easyrishta/View/Dashboard/filter_screen.dart';
import 'package:easyrishta/View/Dashboard/make_match.dart';
import 'package:easyrishta/View/Dashboard/other_profiles.dart';
import 'package:easyrishta/View/Dashboard/profile_info.dart';
import 'package:easyrishta/View/Profile/buildprofile_sceeen.dart';
import 'package:easyrishta/View/Profile/fifthprofile_screen.dart';
import 'package:easyrishta/View/Profile/fourthbuildprofile.dart';
import 'package:easyrishta/View/Profile/lastfinalbuildprofile.dart';
import 'package:easyrishta/View/Profile/sixthbuildprofile.dart';
import 'package:easyrishta/View/Profile/thirdbuildprofile.dart';
import 'package:easyrishta/View/Userinfo/userid.dart';
import 'package:easyrishta/View/auth/authsceens/forget_paassword.dart';
import 'package:easyrishta/View/auth/authsceens/login_Screen.dart';
import 'package:easyrishta/View/auth/authsceens/signup_screen.dart';
import 'package:easyrishta/View/auth/authsceens/splash_screen.dart';
import 'package:easyrishta/View/auth/pinscreen/Otp_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'View/auth/pinscreen/phone_screen.dart';
import 'enums/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: kAppThemeData[AppTheme.light],
              initialRoute: 'splash',
              routes: {
                'splash': (context) => const Splashscreen(),
                'phone': (context) => const MyPhone(),
                'verify': (context) => const OTPScreen(),
                'login': (context) => const LoginScreen(),
                'signup': (context) => const SignUpScreen(),
                'buildprofile': (context) => const ProfileBuild(),
                'thirdbuildprofile': (context) => const ThirdBuildprofile(),
                'fourthbuildprofile': (context) => const FourthBuildprofile(),
                'fifthbuildprofile': (context) => const FifthBuildprofile(),
                'sixthbuildprofile': (context) => const SixthBuildprofile(),
                'addimageprofile': (context) => const Addprofileimage(),
                'userinfoid': (context) => UserId(),
                'Dashboard': (context) => const DasboardScreen(),
                'allprofile': (context) => const OtherProfile(),
                'matching': (context) => const MatchesProfile(),
                'chatroom': (context) => ChatScreen(),
                'forgetpassword': (context) => const ForgetPassword(),
              });
        });
  }
}
