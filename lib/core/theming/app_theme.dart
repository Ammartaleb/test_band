import 'package:flutter/material.dart';
import 'package:test_band/core/theming/app_colors.dart';

/// Implement application's theme
class AppTheme {
  static ThemeData applicationThemeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.kWhite,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.kPrimaryText,
      selectionColor: AppColors.kPrimary,
    ),
    dialogTheme: const DialogThemeData(
      backgroundColor: AppColors.kWhite,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.zero,
        ),
      ),
    ),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: AppColors.kWhite,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.zero,
        ),
      ),
    ),
  );
}
