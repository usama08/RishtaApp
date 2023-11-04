import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyrishta/View/Dashboard/controller/get_data.dart';
import 'package:easyrishta/View/Dashboard/profile_info.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:easyrishta/models/info_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'All User',
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
        ),
        body: StreamBuilder<List<UserInfoData>>(
            stream: UserProviderData().otherUsers,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final userDataList = snapshot.data;

              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: userDataList!.length,
                  itemBuilder: (context, index) {
                    final userData = userDataList[index];

                    return GestureDetector(
                        onTap: () {
                          // Navigate to the user's profile when tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProfileInfo(userData: userData),
                            ),
                          );
                        },
                        child: Container(
                          width: 60.w,
                          height: 68.h,
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              userData.imagePath.isEmpty
                                  ? Container(
                                      width: 60.w,
                                      height: 68.h,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image:
                                                AssetImage(AppImages.infodemo),
                                            fit: BoxFit.cover,
                                          )),
                                    )
                                  : Container(
                                      width: 60.w,
                                      height: 60.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image:
                                              NetworkImage(userData.imagePath),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                              SizedBox(width: 16.w),
                              // Right side text
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      userData.firstname,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 3.h),
                                    Text(
                                      userData.designation,
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showDeleteConfirmationDialog(
                                      context, userData.userId);
                                },
                                icon: const Icon(Icons.delete),
                              )
                              // ignore: prefer_const_constructors
                            ],
                          ),
                        ));
                  });
            }));
  }

  // Function to show a confirmation dialog for user deletion
  void showDeleteConfirmationDialog(BuildContext context, String userId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete User'),
          content: const Text('Are you sure you want to delete this user?'),
          actions: [
            TextButton(
              onPressed: () {
                // Perform the user deletion
                deleteUser(userId);
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  // Function to delete a user document
  void deleteUser(String userId) {
    try {
      FirebaseFirestore.instance.collection('user').doc(userId).delete();
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
