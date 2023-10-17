import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyrishta/View/Profile/buildprofile_sceeen.dart';
import 'package:easyrishta/View/Profile/controller/profile_controller.dart';
import 'package:easyrishta/View/auth/authsceens/login_Screen.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SignupController extends GetxController {
  var profilecontroller = Get.put(PofileController());
  RxBool isLoading = false.obs;
  // RxBool isMalePressed = false.obs;
  // RxBool isFemalePressed = false.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController forgetemail = TextEditingController();
  var obscureText = true.obs;
  var genderis;
  @override
  void onInit() async {
    countryController.text = "+92";
    super.onInit();
  }

  ///========================= function for creating account======================///

  Future<dynamic> registerEmailPassword(context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text.trim().toString(),
              password: password.text.trim().toString());
      if (userCredential.user != null) {
        await FirebaseFirestore.instance
            .collection('user')
            .doc(userCredential.user!.uid.trim().toString())
            .set({
          "userId": userCredential.user!.uid.trim(),
          "Firstname": firstname.text.trim(),
          "Lastname": lastname.text.trim(),
          "Email": email.text.trim(),
          "Phoneno": phoneno.text.trim(),
          "Countrycode": countryController.text.trim(),
          "Gender": genderis,
          "DateofBirth": profilecontroller.datebirth.text.trim(),
          "Religion": profilecontroller.religion.text.trim(),
          "Caste": profilecontroller.caste.text.trim(),
          "MotherTongue": profilecontroller.tongue.text.trim(),
          "Country": profilecontroller.countryValue,
          "State": profilecontroller.stateValue,
          "City": profilecontroller.cityValue,
          "MaritialStatus": profilecontroller.maritialstatus.toString(),
          "TotalChildren": profilecontroller.totalchild.toString(),
          "StatusChildren": profilecontroller.statuschild.toString(),
          "Qualification": profilecontroller.qualification.toString(),
          "Income": profilecontroller.income.toString(),
          "Occupation": profilecontroller.occupation.toString(),
          "Designation": profilecontroller.designation.toString(),
          "Height": profilecontroller.height.toString(),
          "Weight": profilecontroller.weight.toString(),
          "Habbits": profilecontroller.habits.toString(),
          "Smoking": profilecontroller.smoking.toString(),
          "Drinking": profilecontroller.drinking.toString(),
          "Bodytype": profilecontroller.bodytype.toString(),
          "SkinTone": profilecontroller.skintone.toString(),
          "SubCaste": profilecontroller.subcaste.text.trim(),
          "Manglik": profilecontroller.manglik.toString(),
          "Star": profilecontroller.star.toString(),
          "Horoscope": profilecontroller.horoscope.toString(),
          "Gothra": profilecontroller.gothra.text.trim(),
          "MoonSign": profilecontroller.moonsign.toString(),
          "Hobby": profilecontroller.hobby.text.trim(),
          "AboutYourSelf": profilecontroller.aboutyourfelf.text.trim(),
          "imagepath": profilecontroller.imagepth.toString(),
        });
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                color: AppColors.SecondaryColor,
                strokeWidth: 2,
              ),
            );
          },
        );

        await Future.delayed(const Duration(seconds: 3));
        // // Navigate to the home page
        Navigator.pushNamed(context, 'phone');
        // Get.to(() => const LoginScreen());
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) =>  ),
        // );
      }
      User? user = userCredential.user;
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(message: e.code.toString()),
      );
      print('');

      return false;
    } catch (e) {
      return false;
    }
  }

  ///===================function for sign in ==============================///

  Future<dynamic> signInEmailPassword(context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text.trim().toString(),
              password: password.text.trim().toString());

      if (userCredential.user != null) {
        // Navigate to the home page
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                color: AppColors.SecondaryColor,
              ),
            );
          },
        );

        await Future.delayed(const Duration(seconds: 3));

        Get.to(() => const ProfileBuild());

        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) =>  ),
        // );
      }
      print("here is details ${userCredential}");
      User? user = userCredential.user;
      return userCredential;
    } on FirebaseAuthException catch (e) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(message: e.code.toString()),
      );
      print('');

      return false;
    } catch (e) {
      return false;
    }
  }
  //// ----------------- reset password email -----------------/////

  Future<dynamic> sendPasswordResetEmail(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: forgetemail.text.trim().toString());

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset email sent!'),
          backgroundColor: Colors.green,
        ),
      );

      // Navigate to the login screen
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, 'login');
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send password reset email: ${e.code}'),
          backgroundColor: Colors.red,
        ),
      );

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<String> getUserNameFromUID(String uid) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('userData')
        .where('userId', isEqualTo: uid)
        .get();
    return snapshot.docs.first['email'];
  }
}
