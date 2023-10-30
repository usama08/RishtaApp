import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyrishta/models/info_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PofileController extends GetxController {
  double lowheight = 4.0;
  double upperheight = 7.5;
  double lowage = 18.0;
  double upperage = 30.0;
  var imagepth;
  var countryonly = "Pakistan";
  var formattedFirstfullday = "";
  var countryValue = 'Pakistan';
  var stateValue = 'Punjab';
  var cityValue = 'Lahore';
  var maritialstatus = "Separated";
  var totalchild = "Total Children";
  var statuschild = "Status Children";
  var qualification = "Education*";
  var income = "Employee in";
  var occupation = "Occupation";
  var designation = "Designation";
  var height = "Height *";
  var weight = "Weight *";
  var habits = "Eating Habits *";
  var smoking = "Smoking *";
  var drinking = "Drinking *";
  var bodytype = "Body Type *";
  var skintone = "Skin Tone *";
  var horoscope = 'Horoscope';
  var manglik = "Manglik";
  var star = "Star";
  var moonsign = "Moon Sign";
  var martialstatuus = "Marital Status";
  var complextion = "Complexion";
  var mothertongue = "Mother Tongue";
  var filtertongue = "Mother Tongue";
  var religions = "Religion";
  var castee = "Caste";
  var qualifications = "Education*";
  var caste = "Caste";

  var religion = "Religion";
  var tongue = "Mother Tongue";

  TextEditingController hobby = TextEditingController();
  TextEditingController aboutyourfelf = TextEditingController();
  TextEditingController img = TextEditingController();

  /////////////// -----------Step 1 ------------- /////////////////
  Future<void> updateUserData(String userId) async {
    try {
      // Get a reference to the Firestore collection
      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('user');

      final DocumentSnapshot userDoc = await usersCollection.doc(userId).get();
      print("userid");
      if (userDoc.exists) {
        await usersCollection.doc(userId).update({
          "DateofBirth": formattedFirstfullday.toString(),
          "Religion": religion.trim().toString(),
          "Caste": caste.trim().toString(),
          "MotherTongue": tongue.trim().toString(),
          "step": 1,
        });
        print('User data updated successfully');
      } else {
        // User with the given userId does not exist
        print('User does not exist');
      }
    } catch (e) {
      // Handle errors
      print('Error updating user data: $e');
    }
  }

  /////////////// -----------Step 2 ------------- /////////////////
  Future<void> updateUserDatastep2(String userId) async {
    try {
      // Get a reference to the Firestore collection
      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('user');

      final DocumentSnapshot userDoc = await usersCollection.doc(userId).get();
      print("userid");
      if (userDoc.exists) {
        await usersCollection.doc(userId).update({
          "Country": countryValue,
          "State": stateValue,
          "City": cityValue,
          "MaritialStatus": maritialstatus.toString(),
          "TotalChildren": totalchild.toString(),
          "StatusChildren": statuschild.toString(),
          "step": 2,
        });
        print('User data updated successfully');
      } else {
        // User with the given userId does not exist
        print('User does not exist');
      }
    } catch (e) {
      // Handle errors
      print('Error updating user data: $e');
    }
  }

  /////////////// -----------Step 3 ------------- /////////////////
  Future<void> updateUserDatastep3(String userId) async {
    try {
      // Get a reference to the Firestore collection
      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('user');

      final DocumentSnapshot userDoc = await usersCollection.doc(userId).get();
      print("userid");
      if (userDoc.exists) {
        await usersCollection.doc(userId).update({
          "Qualification": qualification.toString(),
          "Income": income.toString(),
          "Occupation": occupation.toString(),
          "Designation": designation.toString(),
          "step": 3,
        });
        print('User data updated successfully');
      } else {
        // User with the given userId does not exist
        print('User does not exist');
      }
    } catch (e) {
      // Handle errors
      print('Error updating user data: $e');
    }
  }

  /////////////// -----------Step 4 ------------- /////////////////
  Future<void> updateUserDatastep4(String userId) async {
    try {
      // Get a reference to the Firestore collection
      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('user');

      final DocumentSnapshot userDoc = await usersCollection.doc(userId).get();
      print("userid");
      if (userDoc.exists) {
        await usersCollection.doc(userId).update({
          "Height": height.toString(),
          "Weight": weight.toString(),
          "Habbits": habits.toString(),
          "Smoking": smoking.toString(),
          "Drinking": drinking.toString(),
          "Bodytype": bodytype.toString(),
          "SkinTone": skintone.toString(),
          "step": 4,
        });
        print('User data updated successfully');
      } else {
        // User with the given userId does not exist
        print('User does not exist');
      }
    } catch (e) {
      // Handle errors
      print('Error updating user data: $e');
    }
  }

  /////////////// -----------Step 5 ------------- /////////////////
  Future<void> updateUserDatastep5(String userId) async {
    try {
      // Get a reference to the Firestore collection
      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('user');

      final DocumentSnapshot userDoc = await usersCollection.doc(userId).get();
      print("userid");
      if (userDoc.exists) {
        await usersCollection.doc(userId).update({
          "Hobby": hobby.text.trim(),
          "AboutYourSelf": aboutyourfelf.text.trim(),
          "step": 5,
        });
        print('User data updated successfully');
      } else {
        // User with the given userId does not exist
        print('User does not exist');
      }
    } catch (e) {
      // Handle errors
      print('Error updating user data: $e');
    }
  }

  ///////  Step Last ///////
  Future<void> updateUserDatastep6(String userId) async {
    try {
      // Get a reference to the Firestore collection
      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('user');

      final DocumentSnapshot userDoc = await usersCollection.doc(userId).get();
      print("userid");
      if (userDoc.exists) {
        if (imagepth == null) {
          print("no image path");
        } else {
          await usersCollection.doc(userId).update({
            "imagepath": imagepth,
            "step": 6,
          });
        }
      } else {
        // User with the given userId does not exist
        print('User does not exist');
      }
    } catch (e) {
      // Handle errors
      print('Error updating user data: $e');
    }
  }

  //////////////////////----------Date Picker-----------------//////////////////
}
