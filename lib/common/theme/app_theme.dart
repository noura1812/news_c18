import 'package:flutter/material.dart';
import 'package:news_c18/common/theme/text_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: AppColors.blackColor,
      titleTextStyle: AppTextStyles.style18w500.copyWith(
        color: AppColors.blackColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    highlightColor: AppColors.blackColor,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
    textTheme: _generateTextTheme(AppColors.blackColor),
  );
  static ThemeData darkTheme = ThemeData(
    highlightColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      elevation: 0,
      foregroundColor: Colors.white,
      titleTextStyle: AppTextStyles.style18w500.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
    primaryColor: AppColors.blackColor,

    scaffoldBackgroundColor: AppColors.blackColor,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blackColor),
    textTheme: _generateTextTheme(Colors.white),
  );

  static TextTheme _generateTextTheme(Color color) {
    return TextTheme(
      displayLarge: AppTextStyles.style24w600.copyWith(color: color),
      displayMedium: AppTextStyles.style20w600.copyWith(color: color),
      headlineLarge: AppTextStyles.style18w600.copyWith(color: color),
      headlineMedium: AppTextStyles.style18w500.copyWith(color: color),
      headlineSmall: AppTextStyles.style18w400.copyWith(color: color),
      titleLarge: AppTextStyles.style16w600.copyWith(color: color),
      titleMedium: AppTextStyles.style16w500.copyWith(color: color),
      titleSmall: AppTextStyles.style16w400.copyWith(color: color),
      labelLarge: AppTextStyles.style14w600.copyWith(color: color),
      labelMedium: AppTextStyles.style14w500.copyWith(color: color),
      labelSmall: AppTextStyles.style14w400.copyWith(color: color),
      bodyLarge: AppTextStyles.style12Bold.copyWith(color: color),
      bodyMedium: AppTextStyles.style12w500.copyWith(color: color),
      bodySmall: AppTextStyles.style12w400.copyWith(color: color),
    );
  }
}

class AppColors {
  static const Color blackColor = Color(0xff171717);
}
