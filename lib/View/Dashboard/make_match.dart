import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyrishta/View/Dashboard/filter_screen.dart';
import 'package:easyrishta/View/Dashboard/matches_profilesdetails.dart';
import 'package:easyrishta/View/auth/controller/auth_controller.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:easyrishta/common/app_svg.dart';
import 'package:easyrishta/models/info_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MatchesProfile extends StatefulWidget {
  const MatchesProfile({super.key});

  @override
  State<MatchesProfile> createState() => _MatchesProfileState();
}

class _MatchesProfileState extends State<MatchesProfile> {
  final SignupController signupController = Get.find();
  late CurrentUser currentUser;
  bool isLoading = true;
  List<UserInfoData> matchedUsers = [];

  @override
  void initState() {
    super.initState();
    signupController.getCurrentUserData().listen((user) {
      setState(() {
        currentUser = user;
        isLoading = false;
      });
    });
  }

  Future<void> checkInterested() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final interestedUserIds = <String>[];

    final interestedUsersQuery = await FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .collection('interested')
        .get();

    for (var doc in interestedUsersQuery.docs) {
      interestedUserIds.add(doc['userId']);
    }

    final snapshot = await signupController.getOtherUsersData().first;

    if (snapshot == null || snapshot.isEmpty) {
      return;
    }

    final updatedMatches = <UserInfoData>[];

    for (final match in snapshot) {
      if (!interestedUserIds.contains(match.userId)) {
        updatedMatches.add(match);
      }
    }

    setState(() {
      matchedUsers = updatedMatches;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
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
          if (matchedUsers.isEmpty) {
            checkInterested();
          }

          return ListView.builder(
            itemCount: matchedUsers.length,
            itemBuilder: (context, index) {
              UserInfoData match = matchedUsers[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MatchesProfiledetails(
                        match: match,
                      ),
                    ),
                  );
                },
                child: MatchCard(
                  match: match,
                  onInterested: () {
                    removeInterested(match);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  void removeInterested(UserInfoData match) {
    final String userId = FirebaseAuth.instance.currentUser!.uid;

    FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .collection('interested')
        .add({
      'email': match.email,
      'name': match.firstname,
      'phone': match.phoneNo,
      'userId': match.userId,
    });

    setState(() {
      matchedUsers.removeWhere((user) => user.userId == match.userId);
    });
  }
}

class MatchCard extends StatefulWidget {
  final UserInfoData match;
  final Function() onInterested;

  const MatchCard({
    Key? key,
    required this.match,
    required this.onInterested,
  }) : super(key: key);

  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  final SignupController signupController = Get.find();
  bool showMore = false;
  bool isInterested = false;

  void expressInterest() {
    setState(() {
      widget.onInterested();
    });

    setState(() {
      isInterested = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.match.imagePath.isEmpty
            ? Container(
                alignment: Alignment.center,
                width: 350.w,
                height: 450.h,
                child: Image.asset(
                  AppImages.infodemo,
                  fit: BoxFit.cover,
                ),
              )
            : Container(
                alignment: Alignment.center,
                width: 350.w,
                height: 450.h,
                child: Image.network(
                  widget.match.imagePath,
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
                              fontSize: 18,
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: AppColors.bottomNavigationbg,
                                        fontSize: 18,
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
                isInterested
                    ? const Text(
                        "Interested",
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      )
                    : InkWell(
                        onTap: expressInterest,
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
