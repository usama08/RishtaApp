import 'package:easyrishta/View/Dashboard/dashboard_screen.dart';
import 'package:easyrishta/View/Dashboard/make_match.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyrishta/View/Dashboard/filter_screen.dart';
import 'package:easyrishta/View/Dashboard/matches_profilesdetails.dart';
import 'package:easyrishta/View/Profile/controller/profile_controller.dart';
import 'package:easyrishta/View/auth/controller/auth_controller.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:easyrishta/common/app_svg.dart';
import 'package:easyrishta/models/info_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MatchesProfilefilterScreen extends StatefulWidget {
  const MatchesProfilefilterScreen({Key? key}) : super(key: key);

  @override
  State<MatchesProfilefilterScreen> createState() =>
      _MatchesProfilefilterScreenfilterState();
}

class _MatchesProfilefilterScreenfilterState
    extends State<MatchesProfilefilterScreen> {
  final SignupController signupController = Get.find();
  final PofileController controllermatch = Get.put(PofileController());

  CurrentUser? currentUser;
  bool isLoading = true;
  List<UserInfoData> matchedUsers = [];
  List<UserInfoData> otherUser = [];

  @override
  void initState() {
    super.initState();

    signupController.getCurrentUserData().listen((user) {
      setState(() {
        currentUser = user;
      });
    });

    signupController.getOtherUsersData().listen((otheruser) {
      setState(() {
        otherUser = otheruser;
      });
    });

    getUserseithoutMatching();

    filter();
  }

  void filter() {
    if (controllermatch.martialstatuus.contains("Martial Status") ||
        controllermatch.upperheight == 7.5 &&
            controllermatch.lowheight == 4.0 &&
            controllermatch.upperage == 60.0 &&
            controllermatch.lowage == 18.0 &&
            controllermatch.complextion == "Complexion" &&
            controllermatch.mothertongue == "Mother Tongue" &&
            controllermatch.religions == "Religion" &&
            controllermatch.castee == "Caste" &&
            controllermatch.qualifications == "Education*" &&
            controllermatch.countryonly == "Pakistan") {
      signupController.filterApplied = false;
    } else {
      signupController.filterApplied = true;

      // Apply the filter
      final filteredUsers = signupController.filterUsersByProfileAndInterest(
        matchedUsers,
        controllermatch,
      );

      setState(() {
        matchedUsers = filteredUsers;
      });
    }
  }

  getUserseithoutMatching() async {
    await Future.delayed(const Duration(seconds: 2));

    if (currentUser != null) {
      matchedUsers = await signupController.getInterestedUsers(
        otherUser,
        currentUser!,
      );
    }

    setState(() {
      isLoading = false;
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

    if (snapshot.isEmpty) {
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

  ongoback() {
    print("ongoBack");
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading || currentUser == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Make Match',
            style: TextStyle(
              color: AppColors.BlackColor,
              fontFamily: 'Poppins-Bold',
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.BlackColor,
              size: 32,
            ),
            onPressed: () {
              Get.until((route) => route.isFirst);
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
                setState(() {
                  controllermatch.resetFilterValues();
                });

                Get.to(const FilterScreen())!.then((value) => ongoback());
              },
            ),
          ],
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    filter();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          'Make Match Filter',
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
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const DasboardScreen(),
              ),
            );
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
              controllermatch.resetFilterValues();
              Get.to(const FilterScreen());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (signupController.filterApplied && matchedUsers.isEmpty)
            const Column(
              children: [
                Center(
                  child: Text(
                    'No matches found with the applied filter.',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ),
              ],
            ),
          if (signupController.filterApplied)
            Container(
              height: 40.h,
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Filter List',
                    style: TextStyle(color: Colors.white),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () {
                      controllermatch.resetFilterValues();
                      Get.to(const MatchesProfile());
                    },
                  ),
                ],
              ),
            ),
          Expanded(
            child: ListView.builder(
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
            ),
          ),
        ],
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
      isLoading = false;
    });
    getUserseithoutMatching();
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
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.infodemo),
                    fit: BoxFit.contain,
                  ),
                ),
              )
            : Container(
                alignment: Alignment.center,
                width: 350.w,
                height: 450.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.match.imagePath),
                    fit: BoxFit.contain,
                  ),
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
                        style: const TextStyle(
                          color: AppColors.bottomNavigationbg,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                        children: <TextSpan>[
                          const TextSpan(text: " "),
                          TextSpan(
                            text: showMore ? "" : " Read More",
                            style: const TextStyle(
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
