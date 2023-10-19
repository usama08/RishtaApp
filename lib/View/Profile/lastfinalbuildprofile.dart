import 'dart:io';
import 'package:easyrishta/View/Profile/verifyData.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../auth/widgets/common_buttons.dart';
import 'controller/profile_controller.dart';

class Addprofileimage extends StatefulWidget {
  const Addprofileimage({super.key});

  @override
  State<Addprofileimage> createState() => _AddprofileimageState();
}

class _AddprofileimageState extends State<Addprofileimage> {
  TextEditingController subcast = TextEditingController();
  var profileController = Get.put(PofileController());
  bool clearPic = false;
  File? image;
  bool isLoading = false;
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
        body: Stack(children: [
          // Background image
          Image.asset(
            AppImages.background, // Replace with your background image
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Sign-up form
          Column(
            children: [
              SizedBox(height: 40.h),
              // Spacer for top margin
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Add Photo',
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
              ),

              Container(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    imagePickermethod(1); // Launch image picker
                  },
                  child: image == null || clearPic == false
                      ? Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape
                                .circle, // This makes the container circular
                            color: AppColors
                                .whiteColor, // Replace with your desired background color
                          ),
                          child: Center(
                            child: Image.asset(
                              AppImages.editprofile,
                              width: 300
                                  .w, // Adjust the width and height as needed
                              height: 300.h,
                            ),
                          ),
                        )
                      : ClipOval(
                          child: Container(
                            width:
                                300.w, // Adjust the width and height as needed
                            height: 300.h,
                            color: AppColors
                                .whiteColor, // Replace with your desired background color
                            child: Image.file(
                              image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: submittButton(
                  context,
                  200.w,
                  50.h,
                  AppColors.actionbut,
                  () {
                    imagePickermethod(1);
                  },
                  "Chose Image",
                  AppColors.whiteColor,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: submittButton(
                  context,
                  double.infinity,
                  45.h,
                  AppColors.actionbut,
                  () {
                    if (image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Your image is Empty*'),
                        ),
                      );
                    } else {
                      refresh();
                      uploadImage();
                    }
                  },
                  "Continue",
                  AppColors.whiteColor,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: submittButton(
                  context,
                  double.infinity,
                  45.h,
                  AppColors.whiteColor,
                  () {
                    Navigator.of(context).pop();
                  },
                  "Previous",
                  AppColors.BlackColor,
                ),
              ),
            ],
          )
        ]),
      );
    }
  }

  final imagepicker = ImagePicker();

  Future<void> imagePickermethod(int check) async {
    final pick = await imagepicker.pickImage(source: ImageSource.gallery);

    if (pick != null) {
      File? croppedFile;

      if (check == 1) {
        final cropped = await ImageCropper().cropImage(
            sourcePath: pick.path,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ],
            uiSettings: [
              AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: AppColors.whiteColor,
                toolbarWidgetColor: AppColors.BlackColor,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false,
              ),
              IOSUiSettings(
                title: 'Cropper',
              ),
            ],
            compressQuality: 30,
            maxWidth: 500, // Set the maximum width of the cropped image
            maxHeight: 500);

        if (cropped != null) {
          croppedFile = File(cropped.path);
        }
      }

      if (mounted) {
        setState(() {
          image = croppedFile ?? croppedFile; // Set the cropped image
          clearPic = true;
        });
        // imageToBytes(image);

        // print("imagebytes${image}");
      }
    } else {}
  }

  uploadImage() async {
    print("print1");
    final firebaseStorage = FirebaseStorage.instance;

    if (image != null) {
      print("print2");
      // Define a unique image path/name
      final imageName = image!.path;
      // Replace with your desired path/name

      // Upload the image to Firebase Storage
      var reference = firebaseStorage.ref().child(imageName);
      var uploadTask = reference.putFile(image!);
      await Future.delayed(Duration(seconds: 3));
      try {
        print("print3");
        profileController.imagepth = await reference.getDownloadURL();

        // Handle the download URL (you can save it or use it as needed)
        print('Download URL: ${profileController.imagepth}');

        await uploadTask.whenComplete(() async {
          print("print4");
          print("when complete");
          String userId = FirebaseAuth.instance.currentUser!.uid;
          await profileController.updateUserDatastep6(userId);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsVerificationScreen(),
            ),
          );
          // Navigator.pushNamed(context, 'Dashboard');
        });
      } catch (e) {
        print('Error uploading image: $e');
      }
    } else {
      print('No Image Path Received');
    }
  }
}
