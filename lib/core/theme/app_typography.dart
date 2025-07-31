import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Typography system for Sanad app optimized for Arabic text
class AppTypography {
  // Font Family
  static const String fontFamily = 'Cairo';
  
  // Font Weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  
  // Text Styles
  static TextStyle get displayLarge => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: bold,
    color: AppColors.textPrimary,
    height: 1.2,
  );
  
  static TextStyle get displayMedium => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: bold,
    color: AppColors.textPrimary,
    height: 1.3,
  );
  
  static TextStyle get displaySmall => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: bold,
    color: AppColors.textPrimary,
    height: 1.3,
  );
  
  static TextStyle get headlineLarge => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: bold,
    color: AppColors.textPrimary,
    height: 1.4,
  );
  
  static TextStyle get headlineMedium => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: semiBold,
    color: AppColors.textPrimary,
    height: 1.4,
  );
  
  static TextStyle get headlineSmall => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: semiBold,
    color: AppColors.textPrimary,
    height: 1.4,
  );
  
  static TextStyle get titleLarge => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: semiBold,
    color: AppColors.textPrimary,
    height: 1.5,
  );
  
  static TextStyle get titleMedium => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: medium,
    color: AppColors.textPrimary,
    height: 1.5,
  );
  
  static TextStyle get titleSmall => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: medium,
    color: AppColors.textSecondary,
    height: 1.5,
  );
  
  static TextStyle get bodyLarge => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: regular,
    color: AppColors.textPrimary,
    height: 1.6,
  );
  
  static TextStyle get bodyMedium => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: regular,
    color: AppColors.textPrimary,
    height: 1.6,
  );
  
  static TextStyle get bodySmall => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: regular,
    color: AppColors.textSecondary,
    height: 1.6,
  );
  
  static TextStyle get labelLarge => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: medium,
    color: AppColors.textPrimary,
    height: 1.4,
  );
  
  static TextStyle get labelMedium => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: medium,
    color: AppColors.textSecondary,
    height: 1.4,
  );
  
  static TextStyle get labelSmall => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: medium,
    color: AppColors.textTertiary,
    height: 1.4,
  );
  
  // Special Text Styles
  static TextStyle get button => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: medium,
    color: AppColors.textInverse,
    height: 1.4,
  );
  
  static TextStyle get caption => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: regular,
    color: AppColors.textTertiary,
    height: 1.4,
  );
  
  static TextStyle get overline => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: medium,
    color: AppColors.textTertiary,
    height: 1.4,
    letterSpacing: 0.5,
  );
  
  // Investment-specific styles
  static TextStyle get investmentAmount => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: bold,
    color: AppColors.primary,
    height: 1.3,
  );
  
  static TextStyle get profitText => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: medium,
    color: AppColors.primary,
    height: 1.4,
  );
  
  static TextStyle get lossText => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: medium,
    color: AppColors.error,
    height: 1.4,
  );
  
  static TextStyle get neutralText => const TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: medium,
    color: AppColors.textPrimary,
    height: 1.4,
  );
} 