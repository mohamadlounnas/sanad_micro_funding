import 'package:flutter/material.dart';

/// App colors with clean single-color design like RedotPay/crypto/iOS
class AppColors {
  // Single primary color - Deep blue like crypto apps
  static const Color primary = Color(0xFF2563EB); // Clean blue
  static const Color primaryLight = Color(0xFF3B82F6);
  static const Color primaryDark = Color(0xFF1D4ED8);
  
  // Background colors - Clean whites
  static const Color background = Color(0xFFFFFFFF); // Pure white
  static const Color surface = Color(0xFFFFFFFF); // Pure white
  static const Color surfaceVariant = Color(0xFFF8FAFC); // Very light gray
  
  // Text colors - Clean contrast
  static const Color textPrimary = Color(0xFF0F172A); // Dark slate
  static const Color textSecondary = Color(0xFF475569); // Medium slate
  static const Color textTertiary = Color(0xFF94A3B8); // Light slate
  static const Color textInverse = Color(0xFFFFFFFF); // Pure white
  
  // Status colors - Single color variations
  static const Color success = Color(0xFF059669); // Green
  static const Color error = Color(0xFFDC2626); // Red
  static const Color warning = Color(0xFFD97706); // Orange
  static const Color info = Color(0xFF0891B2); // Cyan
  
  // Border colors - Clean lines
  static const Color border = Color(0xFFE2E8F0); // Light gray
  static const Color borderDark = Color(0xFFCBD5E1); // Medium gray
  
  // Divider colors
  static const Color divider = Color(0xFFE2E8F0); // Light gray
  
  // Overlay colors
  static const Color overlay = Color(0x80000000); // Semi-transparent black
  static const Color overlayLight = Color(0x40000000); // Light overlay
} 