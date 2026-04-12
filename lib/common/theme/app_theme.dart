import 'package:flutter/material.dart';
import 'package:news_c18/common/theme/text_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blackColor),
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
