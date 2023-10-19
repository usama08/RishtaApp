import 'package:easyrishta/View/Dashboard/filter_screen.dart';
import 'package:easyrishta/View/auth/controller/auth_controller.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:easyrishta/common/app_svg.dart';
import 'package:easyrishta/models/info_list.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:easyrishta/View/Profile/controller/profile_controller.dart';

class MatchesProfile extends StatefulWidget {
  const MatchesProfile({super.key});

  @override
  State<MatchesProfile> createState() => _MatchesProfileState();
}

class _MatchesProfileState extends State<MatchesProfile> {
  final SignupController signupController = Get.find();
  late CurrentUser currentUser; // Initialize 'currentUser'
  bool isLoading = true; // Add a loading flag

  @override
  void initState() {
    super.initState();
    // Fetch the current user's data and set it to the 'currentUser' variable
    signupController.getCurrentUserData().listen((user) {
      setState(() {
        currentUser = user;
        isLoading = false; // Set isLoading to false when data is fetched
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      // Show a loading indicator while data is being fetched
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Make Match',
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
                Icons.filter_alt_outlined,
                color: Colors.red,
                size: 35,
              ),
              onPressed: () {
                Get.to(const FilterScreen());
              },
            ),
          ],
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (currentUser == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Make Match',
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
                Icons.filter_alt_outlined,
                color: Colors.red,
                size: 35,
              ),
              onPressed: () {
                Get.to(const FilterScreen());
              },
            ),
          ],
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          'Make Match',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: AppColors.BlackColor,
              fontFamily: 'Poppins-Bold',
              fontWeight: FontWeight.bold),
        ),
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
              Icons.filter_alt_outlined,
              color: Colors.red,
              size: 35,
            ),
            onPressed: () {
              Get.to(const FilterScreen());
            },
          ),
        ],
      ),
      body: StreamBuilder<List<UserInfoData>>(
        stream: signupController.getOtherUsersData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // Show loading indicator while waiting for data
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No matches found"),
            );
          }

          // Filter and match users based on the current user's country
          List<UserInfoData> matchedUsers = signupController.matchUsers(
            snapshot.data!,
            currentUser,
          );

          return ListView.builder(
            itemCount: matchedUsers.length,
            itemBuilder: (context, index) {
              final UserInfoData match = matchedUsers[index];
              return MatchCard(match: match);
            },
          );
        },
      ),
    );
  }
}

class MatchCard extends StatefulWidget {
  final UserInfoData match;

  const MatchCard({Key? key, required this.match}) : super(key: key);

  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  bool showMore = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 350.w,
          height: 450.h,
          child: Image.network(
            widget.match
                .imagePath, // Replace with the image URL from UserInfoData
            fit: BoxFit.cover,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                    ),
                    child: RichText(
                      maxLines: showMore ? 999 : 4,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text:
                            "Profile Created By ${widget.match.firstname}. ${widget.match.height}, ${widget.match.religion}, ${widget.match.state} ${widget.match.country}.",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: AppColors.bottomNavigationbg,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                        children: <TextSpan>[
                          const TextSpan(text: " "),
                          TextSpan(
                            text: showMore ? "" : " Read More",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  color: AppColors.actionbut,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  showMore = !showMore;
                                });
                              },
                          ),
                          showMore
                              ? TextSpan(
                                  text: widget.match.aboutYourSelf,
                                  style: const TextStyle(
                                    color: AppColors.bottomNavigationbg,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              : const TextSpan(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    AppSvgImages.nextbtn,
                    width: 70.0.w,
                    height: 50.0.h,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
