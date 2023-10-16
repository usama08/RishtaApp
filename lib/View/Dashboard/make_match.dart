import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:easyrishta/common/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MatchesProfile extends StatefulWidget {
  const MatchesProfile({super.key});

  @override
  State<MatchesProfile> createState() => _MatchesProfileState();
}

class _MatchesProfileState extends State<MatchesProfile> {
  @override
  Widget build(BuildContext context) {
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
      ),
      body: Stack(
        children: [
          Image.asset(
            AppImages.background, // Replace with your background image
          ),
          Positioned(
            right: 0.0,
            top: 20.0,
            bottom: 0.0,
            left: 35.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 450.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.user),
                      fit: BoxFit
                          .cover, // This will make the image cover the entire container
                    ),
                  ),
                ),
                Text(
                  "Alina Jolie",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: AppColors.BlackColor,
                      fontFamily: 'Poppins-Bold',
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          RichText(
                            maxLines: 4, // Set the maximum number of lines
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text:
                                  "Profile Created By Self.23 Years, 4ft 6in,Muslim,Punjab Pakistan.",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: AppColors.bottomNavigationbg,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ), // Color for the first part
                              children: <TextSpan>[
                                const TextSpan(text: " "),
                                TextSpan(
                                  text: "Read More",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: AppColors.actionbut,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ), // Color for the second part
                                  // You can add more style properties here if needed
                                ),
                              ],
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
                      ], // Add your other widgets here
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
