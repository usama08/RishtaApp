import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PofileController extends GetxController {
  var imagepth;
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
  var religions = "Religion";
  var castee = "Caste";
  TextEditingController datebirth = TextEditingController();
  TextEditingController religion = TextEditingController();
  TextEditingController caste = TextEditingController();
  TextEditingController tongue = TextEditingController();
  TextEditingController subcaste = TextEditingController();
  TextEditingController gothra = TextEditingController();
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
          "DateofBirth": datebirth.text.trim().toString(),
          "Religion": religion.text.trim().toString(),
          "Caste": caste.text.trim().toString(),
          "MotherTongue": tongue.text.trim().toString(),
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
          "SubCaste": subcaste.text.trim(),
          "Manglik": manglik.toString(),
          "Star": star.toString(),
          "Horoscope": horoscope.toString(),
          "Gothra": gothra.text.trim(),
          "MoonSign": moonsign.toString(),
          "Hobby": hobby.text.trim(),
          "AboutYourSelf": aboutyourfelf.text.trim(),
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
        await usersCollection.doc(userId).update({
          "imagepath": imagepth,
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
}
