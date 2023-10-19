import 'package:easyrishta/View/Profile/controller/profile_controller.dart';
import 'package:easyrishta/View/auth/widgets/common_buttons.dart';
import 'package:easyrishta/View/auth/widgets/dropDown.dart';
import 'package:easyrishta/common/app_image.dart';
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
  double lowheight = 3.5;
  double upperheight = 6;
  double lowage = 18;
  double upperage = 30;
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
                      RangeSliderFlutter(
                        values: [lowheight, upperheight],
                        rangeSlider: true,
                        tooltip: RangeSliderFlutterTooltip(
                          alwaysShowTooltip: false,
                        ),
                        max: 6.5,
                        trackBar: RangeSliderFlutterTrackBar(
                          activeTrackBar: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.themeColor,
                          ),
                          inactiveTrackBar: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                        ),
                        min: 3,
                        fontSize: 12,
                        textBackgroundColor: AppColors.themeColor,
                        onDragging: (handlerIndex, lowerValue, upperValue) {
                          lowheight = lowerValue;
                          upperheight = upperValue;
                          setState(() {});
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${lowheight.toStringAsFixed(1)} ft", // Display the lower value
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                            ),
                            Text(
                              "${upperheight.toStringAsFixed(1)} ft", // Display the upper value
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
                      RangeSliderFlutter(
                        values: [lowage, upperage],
                        rangeSlider: true,
                        tooltip: RangeSliderFlutterTooltip(
                          alwaysShowTooltip: false,
                        ),
                        max: 35,
                        trackBar: RangeSliderFlutterTrackBar(
                          activeTrackBar: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.themeColor,
                          ),
                          inactiveTrackBar: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                        ),
                        min: 16,
                        fontSize: 12,
                        textBackgroundColor: AppColors.themeColor,
                        onDragging: (handlerIndex, lowerValue, upperValue) {
                          lowage = lowerValue;
                          upperage = upperValue;
                          setState(() {});
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${lowage.toStringAsFixed(1)} years", // Display the lower value
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                            ),
                            Text(
                              "${upperage.toStringAsFixed(1)} years", // Display the upper value
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
                      controllerProfile.countryonly = newValue!;
                      print("Value: ${newValue}");
                    });
                  },
                  selectedValue: controllerProfile.countryonly.toString(),
                  values: const [
                    "Pakistan",
                    "Saudi Arabia",
                    "Iran",
                    "Indonesia",
                    "Egypt",
                    "Turkey",
                    "Bangladesh",
                    "Algeria",
                    "Iraq",
                    "Morocco",
                    "Nigeria"
                        "Afghanistan",
                    "Malaysia",
                    "Uzbekistan",
                    "Sudan",
                    "Yemen",
                    "Syria",
                    "Jordan",
                    "Tunisia",
                    "United Arab Emirates",
                    "Russia",
                    "Germany",
                    "France",
                    "United Kingdom",
                    "Italy",
                    "Spain",
                    "Ukraine",
                    "Poland",
                    "Romania",
                    "Netherlands",
                    "Belgium",
                    "Greece",
                    "Sweden",
                    "Portugal",
                    "Austria",
                    "Czech Republic",
                    "Hungary",
                    "Switzerland",
                    "Bulgaria",
                    "Denmark",
                  ],
                  labels: const [
                    "Pakistan",
                    "Saudi Arabia",
                    "Iran",
                    "Indonesia",
                    "Egypt",
                    "Turkey",
                    "Bangladesh",
                    "Algeria",
                    "Iraq",
                    "Morocco",
                    "Nigeria"
                        "Afghanistan",
                    "Malaysia",
                    "Uzbekistan",
                    "Sudan",
                    "Yemen",
                    "Syria",
                    "Jordan",
                    "Tunisia",
                    "United Arab Emirates",
                    "Russia",
                    "Germany",
                    "France",
                    "United Kingdom",
                    "Italy",
                    "Spain",
                    "Ukraine",
                    "Poland",
                    "Romania",
                    "Netherlands",
                    "Belgium",
                    "Greece",
                    "Sweden",
                    "Portugal",
                    "Austria",
                    "Czech Republic",
                    "Hungary",
                    "Switzerland",
                    "Bulgaria",
                    "Denmark",
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
                submittButton(context, 378.w, 50.h, AppColors.themeColor, () {},
                    "Save & Search", AppColors.whiteColor)
              ],
            ),
          )
        ],
      ),
    );
  }
}
