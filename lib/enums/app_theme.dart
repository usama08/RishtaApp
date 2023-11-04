import 'package:easyrishta/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum AppTheme {
  light,
}

final Map<AppTheme, ThemeData> kAppThemeData = {
  AppTheme.light: ThemeData.light().copyWith(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    canvasColor: AppColors.whiteColor,
    splashColor: AppColors.whiteColor.withOpacity(0.1),
    useMaterial3: true,
    bottomSheetTheme: const BottomSheetThemeData(
      elevation: 0,
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: Colors.transparent,
      modalBackgroundColor: Colors.transparent,
    ),
    dialogTheme: const DialogTheme(
        backgroundColor: AppColors.whiteColor,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent),
    textTheme: const TextTheme().copyWith(
      displayLarge: const TextStyle(
        fontSize: 40,
        fontFamily: 'Poppins',
        color: AppColors.BlackColor,
      ),
      displayMedium: const TextStyle(
        fontSize: 30,
        fontFamily: 'Poppins',
        color: AppColors.BlackColor,
      ),
      displaySmall: const TextStyle(
        fontSize: 24,
        fontFamily: 'Poppins',
        color: AppColors.BlackColor,
      ),
      headlineMedium: const TextStyle(
          fontSize: 20,
          fontFamily: 'Poppins',
          color: AppColors.BlackColor,
          fontWeight: FontWeight.bold),
      headlineSmall: const TextStyle(
        fontSize: 18,
        fontFamily: 'Poppins',
        color: AppColors.BlackColor,
      ),
      titleLarge: const TextStyle(
        fontSize: 16,
        fontFamily: 'Poppins',
        color: AppColors.BlackColor,
      ),
      bodyLarge: const TextStyle(
        fontSize: 18,
        fontFamily: 'Poppins',
        color: AppColors.BlackColor,
      ),
      bodyMedium: const TextStyle(
          fontSize: 14,
          fontFamily: 'Poppins',
          color: AppColors.BlackColor,
          fontWeight: FontWeight.normal),
      bodySmall: const TextStyle(
        fontSize: 12,
        fontFamily: 'Poppins',
        color: AppColors.BlackColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: AppColors.BlackColor.withOpacity(0.5),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      elevation: 0,
      centerTitle: false,
      backgroundColor: AppColors.whiteColor,
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
        color: AppColors.whiteColor,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.whiteColor,
      ),
      actionsIconTheme: const IconThemeData(
        color: AppColors.whiteColor,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      selectedItemColor: AppColors.BlackColor,
      selectedIconTheme: IconThemeData(
        color: AppColors.primaryColor,
        size: 24,
      ),
      elevation: 0,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: AppColors.whiteColor,
    ),
    colorScheme: const ColorScheme.light()
        .copyWith(
          background: AppColors.whiteColor,
          surface: AppColors.BlackColor,
          primary: AppColors.primaryColor,
          secondary: AppColors.primaryColor,
        )
        .copyWith(background: AppColors.primaryColor)
        .copyWith(error: AppColors.redColor),
  ),
};
