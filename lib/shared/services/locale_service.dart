import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_localization.dart';

/// Service for managing app locale state
class LocaleService extends ChangeNotifier {
  static const String _localeKey = 'locale';
  
  Locale _currentLocale = AppLocalization.defaultLocale;
  
  Locale get currentLocale => _currentLocale;
  
  LocaleService() {
    _loadLocale();
  }
  
  /// Load locale from shared preferences
  Future<void> _loadLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final languageCode = prefs.getString('${_localeKey}_language') ?? AppLocalization.defaultLocale.languageCode;
      final countryCode = prefs.getString('${_localeKey}_country') ?? AppLocalization.defaultLocale.countryCode;
      _currentLocale = Locale(languageCode, countryCode);
      notifyListeners();
    } catch (e) {
      // Use default locale as fallback
      _currentLocale = AppLocalization.defaultLocale;
    }
  }
  
  /// Save locale to shared preferences
  Future<void> _saveLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('${_localeKey}_language', _currentLocale.languageCode);
      await prefs.setString('${_localeKey}_country', _currentLocale.countryCode ?? '');
    } catch (e) {
      // Ignore save errors
    }
  }
  
  /// Set specific locale
  Future<void> setLocale(Locale locale) async {
    if (_currentLocale != locale) {
      _currentLocale = locale;
      await _saveLocale();
      notifyListeners();
    }
  }
  
  /// Toggle between supported locales
  Future<void> toggleLocale() async {
    final currentIndex = AppLocalization.supportedLocales.indexOf(_currentLocale);
    final nextIndex = (currentIndex + 1) % AppLocalization.supportedLocales.length;
    await setLocale(AppLocalization.supportedLocales[nextIndex]);
  }
  
  /// Get current language name
  String get currentLanguageName {
    return AppLocalization.languageNames[_currentLocale.languageCode] ?? 
           _currentLocale.languageCode.toUpperCase();
  }
  
  /// Get current country name
  String get currentCountryName {
    return AppLocalization.countryNames[_currentLocale.countryCode] ?? 
           _currentLocale.countryCode ?? '';
  }
  
  /// Check if current locale is Arabic
  bool get isArabic => _currentLocale.languageCode == 'ar';
  
  /// Check if current locale is English
  bool get isEnglish => _currentLocale.languageCode == 'en';
  
  /// Get text direction for current locale
  TextDirection get textDirection {
    return isArabic ? TextDirection.rtl : TextDirection.ltr;
  }
  
  /// Get text alignment for current locale
  TextAlign get textAlign {
    return isArabic ? TextAlign.right : TextAlign.left;
  }
} 