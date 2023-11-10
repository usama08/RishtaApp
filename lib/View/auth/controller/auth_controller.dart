import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyrishta/View/Profile/buildprofile_sceeen.dart';
import 'package:easyrishta/View/Profile/controller/profile_controller.dart';
import 'package:easyrishta/View/Profile/fifthprofile_screen.dart';
import 'package:easyrishta/View/Profile/fourthbuildprofile.dart';
import 'package:easyrishta/View/Profile/lastfinalbuildprofile.dart';
import 'package:easyrishta/View/Profile/sixthbuildprofile.dart';
import 'package:easyrishta/View/Profile/thirdbuildprofile.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/models/info_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SignupController extends GetxController {
  var profilecontroller = Get.put(PofileController());
  RxBool isLoading = false.obs;
  bool shouldApplyFilter = false;
  bool filterApplied = false;
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
  TextEditingController loginemail = TextEditingController();
  TextEditingController passworrd = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var obscureText = true.obs;
  var genderis;
  @override
  void onInit() async {
    countryController.text = "+92";
    super.onInit();
  }

  getvalue() {
    phoneController.text = phoneno.text;
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
          "DateofBirth": profilecontroller.formattedFirstfullday.toUpperCase(),
          "Religion": profilecontroller.religion.trim(),
          "Caste": profilecontroller.caste.trim(),
          "MotherTongue": profilecontroller.tongue.trim(),
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
          "Hobby": profilecontroller.hobby.text.trim(),
          "AboutYourSelf": profilecontroller.aboutyourfelf.text.trim(),
          "imagepath": profilecontroller.imagepth.toString(),
          "step": 0,
          "userType": "user",
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

////////////////// -----------    --------------------- //////////

  Future<dynamic> signInEmailPassword(context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginemail.text.trim().toString(),
        password: passworrd.text.trim().toString(),
      );

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

        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('user')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();

        String userRole = userSnapshot['userType'];

        if (userRole == "user") {
          String userStep =
              userSnapshot['step'].toString(); // Access the "step" field

          if (userStep == "0") {
            Get.to(() => const ProfileBuild());
          } else if (userStep == "1") {
            Get.to(() => const ThirdBuildprofile());
          } else if (userStep == "2") {
            Get.to(() => const FourthBuildprofile());
          } else if (userStep == "3") {
            Get.to(() => const FifthBuildprofile());
          } else if (userStep == "4") {
            Get.to(() => const SixthBuildprofile());
          } else if (userStep == "5") {
            Get.to(() => const Addprofileimage());
          } else {
            Navigator.pushNamed(context, 'Dashboard');
          }
        } else if (userRole == "admin") {
          Navigator.pushNamed(context, 'admindashboard');
        } else {
          // Handle other roles or scenarios
          print("Unknown role or scenario");
        }

        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) =>  ),
        // );
      }
      print("here is details ${userCredential}");

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
        .collection('user')
        .where('userId', isEqualTo: uid)
        .get();
    return snapshot.docs.first['email'];
  }

  //getting step to route to specific screen
  Future<String> getStepFromFirebase(String uid) async {
    print("before snapshot");
    // final snapshot = await FirebaseFirestore.instance
    //     .collection('user')
    //     .where('userId', isEqualTo: uid)
    //     .get();

    QuerySnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('userId', isEqualTo: uid)
        .get();
    print("in snapshot" + userSnapshot.docs.first['step']);
    return userSnapshot.docs.first['step'];
  }

///////////////------Matching---------------------////////
// other user data //

  Stream<List<UserInfoData>> getOtherUsersData() {
    final String userId = FirebaseAuth.instance.currentUser!.uid;

    return FirebaseFirestore.instance
        .collection('user')
        .where('userId', isNotEqualTo: userId) // Exclude the current user
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) =>
                UserInfoData.fromMap(doc.data() as Map<String, dynamic>))
            .toList());
  }

  // Current user //
  Stream<CurrentUser> getCurrentUserData() {
    final String userId = FirebaseAuth.instance.currentUser!.uid;

    return FirebaseFirestore.instance
        .collection('user')
        .where('userId', isEqualTo: userId) // Filter for the current user
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        return CurrentUser.fromMap(
            snapshot.docs.first.data() as Map<String, dynamic>);
      } else {
        // Return a default UserInfoData or handle this case as needed
        return CurrentUser(
            country: "",
            userId: "",
            occupation: '',
            caste: '',
            gender: ''); // You may need to define a default constructor
      }
    });
  }

  List<String> interestedUserIds = [];
  Future<List<UserInfoData>> getInterestedUsers(
      List<UserInfoData> otherUsers, CurrentUser currentUser) async {
    interestedUserIds.clear();
    final String userId = FirebaseAuth.instance.currentUser!.uid;

    final parentDocumentRef =
        FirebaseFirestore.instance.collection('user').doc(userId);

    final subcollectionRef = parentDocumentRef.collection('interested');

    final subcollectionSnapshot = await subcollectionRef.get();

    if (subcollectionSnapshot.docs.isNotEmpty) {
      for (QueryDocumentSnapshot doc in subcollectionSnapshot.docs) {
        String interestedUserId = doc['userId'];

        interestedUserIds.add(interestedUserId);

        print('Interested User ID: $interestedUserId');
      }
    } else {
      print('No Interested users found.');
    }

    List<UserInfoData> matchedUsers = await matchUsers(otherUsers, currentUser);

    // Remove interested users from matched list
    matchedUsers.removeWhere((user) => interestedUserIds.contains(user.userId));

    return matchedUsers;
  }

  Future<List<UserInfoData>> matchUsers(
      List<UserInfoData> otherUsers, CurrentUser currentUser) async {
    List<UserInfoData> matchedUsers = [];

    String currentUserCountry = currentUser.country;
    String currentUserGender = currentUser.gender;

    if (currentUserCountry.isNotEmpty && otherUsers.isNotEmpty) {
      for (UserInfoData otherUser in otherUsers) {
        if (otherUser.country == currentUserCountry &&
            currentUserGender != otherUser.gender) {
          if (interestedUserIds.isNotEmpty &&
              !interestedUserIds.contains(otherUser.userId)) {
            matchedUsers.add(otherUser);
          } else if (interestedUserIds.isEmpty) {
            matchedUsers.add(otherUser);
          }
        }
      }
    }

    return matchedUsers;
  }

  double convertHeightStringToDouble(String heightString) {
    // Split the string into feet and inches
    List<String> parts = heightString.split(' ');
    int feet = int.parse(parts[0]);
    int inches = int.parse(parts[2]);

    // Convert to double (assuming 12 inches in a foot)
    return feet + (inches / 12);
  }

  //// ----------fitter matches--------------///
  List<UserInfoData> filterUsersByProfileAndInterest(
    List<UserInfoData> otherUsers,
    PofileController profileController,
  ) {
    List<UserInfoData> matchedUsers = [];

    for (UserInfoData otherUser in otherUsers) {
      double otherUserHeight = convertHeightStringToDouble(otherUser.height);

      if ((otherUser.country == profileController.countryonly ||
              otherUser.religion == profileController.religions ||
              otherUser.motherTongue == profileController.mothertongue ||
              otherUser.qualification == profileController.qualifications ||
              (otherUserHeight >= profileController.lowheight &&
                  otherUserHeight <= profileController.upperheight) ||
              otherUser.caste == profileController.castee) &&
          !interestedUserIds.contains(otherUser.userId)) {
        matchedUsers.add(otherUser);
      }
    }

    return matchedUsers;
  }
}
