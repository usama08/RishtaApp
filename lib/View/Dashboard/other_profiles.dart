import 'package:easyrishta/View/Dashboard/controller/get_data.dart';
import 'package:easyrishta/View/Dashboard/profile_info.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:easyrishta/models/info_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherProfile extends StatefulWidget {
  const OtherProfile({super.key});

  @override
  State<OtherProfile> createState() => _OtherProfileState();
}

class _OtherProfileState extends State<OtherProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profiles',
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

              return GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0, // Adjust the horizontal spacing
                    mainAxisSpacing: 10.0, // Adjust the vertical spacing
                  ),
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
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  userData.imagePath.isEmpty
                                      ? Container(
                                          width: 170.w,
                                          height: 180.h,
                                          child: Image.asset(
                                            AppImages.profile,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center,
                                            filterQuality: FilterQuality.low,
                                          ),
                                        )
                                      : Container(
                                          width: 170.w,
                                          height: 180.h,
                                          child: Image.network(
                                            userData.imagePath,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center,
                                            cacheHeight: 150,
                                            cacheWidth: 150,
                                            filterQuality: FilterQuality.low,
                                          ),
                                        ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    userData.firstname.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                            color: AppColors.BlackColor,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    userData.designation.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                            color: AppColors.BlackColor,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.normal),
                                  ),
                                  const SizedBox(height: 5.0),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        ));
                  });
            }));
  }
}
