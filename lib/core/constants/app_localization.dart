import 'package:flutter/material.dart';

/// Localization constants for Sanad app
class AppLocalization {
  // Supported locales
  static const List<Locale> supportedLocales = [
    Locale('ar', 'DZ'), // Arabic - Algeria
    Locale('en', 'US'), // English - United States (fallback)
  ];
  
  // Default locale
  static const Locale defaultLocale = Locale('ar', 'DZ');
  
  // Text direction
  static const TextDirection defaultTextDirection = TextDirection.rtl;
  
  // Language names
  static const Map<String, String> languageNames = {
    'ar': 'العربية',
    'en': 'English',
  };
  
  // Country names
  static const Map<String, String> countryNames = {
    'DZ': 'الجزائر',
    'US': 'United States',
  };
  
  // Currency
  static const String defaultCurrency = 'DZD';
  static const String defaultCurrencySymbol = 'د.ج';
  
  // Date formats
  static const String dateFormat = 'dd/MM/yyyy';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'dd/MM/yyyy HH:mm';
  
  // Number formats
  static const String numberFormat = '#,##0.00';
  static const String currencyFormat = '#,##0.00 د.ج';
  
  // Time zones
  static const String defaultTimeZone = 'Africa/Algiers';
  
  // RTL specific constants
  static const double rtlIconRotation = 0.0; // No rotation needed for Arabic
  static const bool rtlMirrorIcons = false; // Don't mirror icons for Arabic
  
  // Text alignment
  static const TextAlign defaultTextAlign = TextAlign.right;
  static const TextAlign defaultTextAlignLtr = TextAlign.left;
  
  // Margins and padding adjustments for RTL
  static const EdgeInsets rtlMargin = EdgeInsets.only(right: 16.0);
  static const EdgeInsets ltrMargin = EdgeInsets.only(left: 16.0);
  
  // Icon positioning
  static const MainAxisAlignment rtlMainAxisAlignment = MainAxisAlignment.end;
  static const MainAxisAlignment ltrMainAxisAlignment = MainAxisAlignment.start;
  
  // List direction
  static const Axis rtlListDirection = Axis.horizontal;
  static const Axis ltrListDirection = Axis.horizontal;
} 