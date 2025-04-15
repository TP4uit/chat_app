import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Font provider that can be used to change the font across the entire app
class FontProvider extends ChangeNotifier {
  String _currentFont = 'Default';
  
  String get currentFont => _currentFont;
  
  // Constructor that loads saved font preference
  FontProvider() {
    _loadFontPreference();
  }
  
  // Load font preference from local storage
  Future<void> _loadFontPreference() async {
    final prefs = await SharedPreferences.getInstance();
    _currentFont = prefs.getString('app_font') ?? 'Default';
    notifyListeners();
  }
  
  // Update the font and save the preference
  Future<void> updateFont(String newFont) async {
    if (_currentFont != newFont) {
      _currentFont = newFont;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('app_font', newFont);
      notifyListeners();
    }
  }
}

// Custom theme class that includes the font
class AppThemeManager {
  static ThemeData getThemeWithFont(ThemeData baseTheme, String fontFamily) {
    // If default font is selected, use the base theme's font
    if (fontFamily == 'Default') {
      return baseTheme;
    }
    
    // Otherwise, create a new theme with the selected font
    return baseTheme.copyWith(
      textTheme: baseTheme.textTheme.apply(
        fontFamily: fontFamily,
      ),
      primaryTextTheme: baseTheme.primaryTextTheme.apply(
        fontFamily: fontFamily,
      ),
    );
  }
}