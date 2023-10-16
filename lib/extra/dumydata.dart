import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:easyrishta/View/Profile/controller/profile_controller.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountryStateCityPickerScreen extends StatefulWidget {
  const CountryStateCityPickerScreen({super.key});

  @override
  _CountryStateCityPickerScreenState createState() =>
      _CountryStateCityPickerScreenState();
}

class _CountryStateCityPickerScreenState
    extends State<CountryStateCityPickerScreen> {
  var profileController = Get.put(PofileController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SelectState(
              style: const TextStyle(
                color: AppColors.BlackColor, // Change text color here
                fontSize: 16, // Adjust text size here
              ),
              onCountryChanged: (value) {
                setState(() {
                  profileController.countryValue = value;
                });
              },
              onStateChanged: (value) {
                setState(() {
                  profileController.stateValue = value;
                });
              },
              onCityChanged: (value) {
                setState(() {
                  profileController.cityValue = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
