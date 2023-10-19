import 'package:easyrishta/View/Profile/controller/profile_controller.dart';
import 'package:easyrishta/View/auth/widgets/dropDown.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  var controllerProfile = Get.put(PofileController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  DateTime selectedDate = DateTime.now();

  // Your DatePicker function
  void selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: customDatePickerTheme(context), // Apply the custom theme
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        profileController.formattedFirstfullday =
            DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    profileController.formattedFirstfullday =
        DateFormat('dd/MM/yyyy').format(DateTime.now());
  }

  ThemeData customDatePickerTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Colors.blue, // Change the primary color
      hintColor: Colors.blueAccent,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.themeColor, // Change the accent color
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black), // Change the text color
        titleMedium: TextStyle(color: Colors.black), // Change the subtext color
      ),
      dialogBackgroundColor: AppColors
          .whiteColor, // Change the background color of the date picker dialog
      // You can customize more theme properties as needed
    );
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
                        GestureDetector(
                          onTap: () {
                            // controllerProvidertext.resetDates();
                            selectDate();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.850,
                            height: MediaQuery.of(context).size.height * 0.058,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.BlackColor,
                                width: 0.5,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  size: 32,
                                  color: AppColors.themeColor,
                                ),
                                Text(
                                    "Date of Birth : ${profileController.formattedFirstfullday.toString()}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.BlackColor)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomDropdown(
                          onchangedF: (String? newValue) {
                            setState(() {
                              controllerProfile.religion = newValue!;
                              print("Value: ${newValue}");
                            });
                          },
                          selectedValue: controllerProfile.religion.toString(),
                          values: const [
                            "Religion",
                            "Islam",
                            "Christianity",
                            "Hinduism",
                            "Buddhism",
                            "Sikhism",
                            "Judaism",
                            "Bahá'í Faith",
                            "Jainism",
                            "Shinto",
                            "Taoism",
                            "Confucianism",
                            "Zoroastrianism"
                          ],
                          labels: const [
                            "Religion",
                            "Islam",
                            "Christianity",
                            "Hinduism",
                            "Buddhism",
                            "Sikhism",
                            "Judaism",
                            "Bahá'í Faith",
                            "Jainism",
                            "Shinto",
                            "Taoism",
                            "Confucianism",
                            "Zoroastrianism"
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomDropdown(
                          onchangedF: (String? newValue) {
                            setState(() {
                              controllerProfile.caste = newValue!;
                              print("Value: ${newValue}");
                            });
                          },
                          selectedValue: controllerProfile.caste.toString(),
                          values: const [
                            "Caste",
                            "Punjabis",
                            "Sindhis",
                            "Pashtuns (Pathans)",
                            "Balochis",
                            "Kashmiris",
                            "Saraikis",
                            "Baltis",
                            "Hazaras",
                            "Seraikis",
                            "Brahuis",
                            "Other"
                          ],
                          labels: const [
                            "Caste",
                            "Punjabis",
                            "Sindhis",
                            "Pashtuns (Pathans)",
                            "Balochis",
                            "Kashmiris",
                            "Saraikis",
                            "Baltis",
                            "Hazaras",
                            "Seraikis",
                            "Brahuis",
                            "Other"
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomDropdown(
                          onchangedF: (String? newValue) {
                            setState(() {
                              controllerProfile.tongue = newValue!;
                              print("Value: ${newValue}");
                            });
                          },
                          selectedValue: controllerProfile.tongue.toString(),
                          values: const [
                            "Mother Tongue",
                            "Urdu",
                            "Punjabi",
                            "English",
                            "Sindhi",
                            "Pashton",
                            "Saraki",
                            "Balochi",
                            "Other"
                          ],
                          labels: const [
                            "Mother Tongue",
                            "Urdu",
                            "Punjabi",
                            "English",
                            "Sindhi",
                            "Pashton",
                            "Saraki",
                            "Balochi",
                            "Other"
                          ],
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
                    if (profileController.formattedFirstfullday
                        .toString()
                        .isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Your Date of Birth is Empty*'),
                        ),
                      );
                    } else if (profileController.religion.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Your Religion is Empty*'),
                        ),
                      );
                    } else if (profileController.caste.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Your Caste is Empty*'),
                        ),
                      );
                    } else if (profileController.tongue.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Your Tongue is Empty*'),
                        ),
                      );
                    } else {
                      String userId = FirebaseAuth.instance.currentUser!.uid;
                      profileController.updateUserData(userId);
                      refresh();
                      Navigator.pushNamed(context, 'thirdbuildprofile');
                    }
                  },
                  "Continue",
                  AppColors.whiteColor,
                ),
              ],
            ),
          ),
        ],
      ));
    }
  }
}
