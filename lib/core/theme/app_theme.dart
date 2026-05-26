import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF00E5FF); // Cyan/Teal accent
  static const Color secondaryColor = Color(0xFF651FFF); // Deep Purple accent
  static const Color backgroundColor = Color(0xFF0A0E17); // Deep dark blue background
  static const Color surfaceColor = Color(0xFF131A2A); // Slightly lighter for cards
  static const Color textPrimary = Color(0xFFE2E8F0); // Off-white
  static const Color textSecondary = Color(0xFF94A3B8); // Gray

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: primaryColor,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: secondaryColor,
        surface: surfaceColor,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.inter(color: textPrimary, fontWeight: FontWeight.bold, fontSize: 56),
        displayMedium: GoogleFonts.inter(color: textPrimary, fontWeight: FontWeight.bold, fontSize: 48),
        displaySmall: GoogleFonts.inter(color: textPrimary, fontWeight: FontWeight.bold, fontSize: 36),
        headlineLarge: GoogleFonts.inter(color: textPrimary, fontWeight: FontWeight.bold, fontSize: 32),
        headlineMedium: GoogleFonts.inter(color: textPrimary, fontWeight: FontWeight.w600, fontSize: 28),
        headlineSmall: GoogleFonts.inter(color: textPrimary, fontWeight: FontWeight.w600, fontSize: 24),
        titleLarge: GoogleFonts.inter(color: textPrimary, fontWeight: FontWeight.w600, fontSize: 20),
        titleMedium: GoogleFonts.inter(color: textPrimary, fontWeight: FontWeight.w500, fontSize: 16),
        bodyLarge: GoogleFonts.inter(color: textPrimary, fontSize: 16, height: 1.5),
        bodyMedium: GoogleFonts.inter(color: textSecondary, fontSize: 14, height: 1.5),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: const BorderSide(color: primaryColor, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: surfaceColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.white.withValues(alpha: 0.05), width: 1),
        ),
      ),
    );
  }
}
