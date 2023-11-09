import 'package:easyrishta/View/Dashboard/filter_matchingscren.dart';
import 'package:easyrishta/View/Dashboard/make_match.dart';
import 'package:easyrishta/View/Profile/controller/profile_controller.dart';
import 'package:easyrishta/View/auth/widgets/common_buttons.dart';
import 'package:easyrishta/View/auth/widgets/dropDown.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:easyrishta/extra/dumydata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:range_slider_flutter/range_slider_flutter.dart';

import '../../common/app_colors.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var controllerProfile = Get.put(PofileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filter',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: AppColors.BlackColor,
              fontFamily: 'Poppins-Bold',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.BlackColor,
            size: 32,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.close, // Use the close icon
              color: Colors.red, // Set the color to red
              size: 35,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            AppImages.background, // Replace with your background image
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDropdown(
                  onchangedF: (String? newValue) {
                    setState(() {
                      controllerProfile.martialstatuus = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.martialstatuus.toString(),
                  values: const [
                    "Marital Status",
                    "Married",
                    "Divorced",
                    "Single",
                  ],
                  labels: const [
                    "Marital Status",
                    "Married",
                    "Divorced",
                    "Single",
                  ],
                ),
                SizedBox(height: 10.h),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      RangeSlider(
                        activeColor: AppColors.themeColor,
                        values: RangeValues(controllerProfile.lowheight,
                            controllerProfile.upperheight),
                        min: 4.0, // Minimum value
                        max: 7.5, // Maximum value
                        onChanged: (RangeValues values) {
                          setState(() {
                            controllerProfile.lowheight = values.start;
                            controllerProfile.upperheight = values.end;
                          });
                        },
                        labels: RangeLabels(
                          controllerProfile.lowheight
                              .toStringAsFixed(1), // Format the labels
                          controllerProfile.upperheight.toStringAsFixed(1),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${controllerProfile.lowheight.toStringAsFixed(1)} ft", // Display the lower value
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                            ),
                            Text(
                              "${controllerProfile.upperheight.toStringAsFixed(1)} ft", // Display the upper value
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      RangeSlider(
                        activeColor: AppColors.themeColor,
                        values: RangeValues(controllerProfile.lowage,
                            controllerProfile.upperage),
                        min: 18.0, // Minimum value
                        max: 70.0, // Maximum value
                        onChanged: (RangeValues values) {
                          setState(() {
                            controllerProfile.lowage = values.start;
                            controllerProfile.upperage = values.end;
                          });
                        },
                        labels: RangeLabels(
                          controllerProfile.lowage
                              .toStringAsFixed(1), // Format the labels
                          controllerProfile.upperage.toStringAsFixed(1),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${controllerProfile.lowage.toStringAsFixed(1)} years", // Display the lower value
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                            ),
                            Text(
                              "${controllerProfile.upperage.toStringAsFixed(1)} years", // Display the upper value
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                CustomDropdown(
                  onchangedF: (String? newValue) {
                    setState(() {
                      controllerProfile.complextion = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.complextion.toString(),
                  values: const [
                    "Complexion",
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
                    "Complexion",
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
                SizedBox(height: 10.h),
                CustomDropdown(
                  onchangedF: (String? newValue) {
                    setState(() {
                      controllerProfile.mothertongue = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.mothertongue.toString(),
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
                SizedBox(height: 10.h),
                CustomDropdown(
                  onchangedF: (String? newValue) {
                    setState(() {
                      controllerProfile.religions = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.religions.toString(),
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
                SizedBox(height: 10.h),
                CustomDropdown(
                  onchangedF: (String? newValue) {
                    setState(() {
                      controllerProfile.castee = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.castee.toString(),
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
                SizedBox(height: 10.h),
                CustomDropdown(
                  onchangedF: (String? newValue) {
                    setState(() {
                      controllerProfile.qualifications = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.qualifications.toString(),
                  values: const [
                    "Education*",
                    "Matric",
                    "intermediate",
                    "Bachelor",
                    "Masters",
                    "PHD"
                  ],
                  labels: const [
                    "Education*",
                    "Matric",
                    "intermediate",
                    "Bachelor",
                    "Masters",
                    "PHD"
                  ],
                ),
                SizedBox(height: 10.h),
                const CountryOnly(),
                SizedBox(height: 10.h),
                submittButton(context, 378.w, 50.h, AppColors.themeColor, () {
                  Get.to(const MatchesProfilefilterScreen());
                }, "Save & Search", AppColors.whiteColor)
              ],
            ),
          )
        ],
      ),
    );
  }
}
