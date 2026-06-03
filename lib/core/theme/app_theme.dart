import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Common Colors
  static const Color primaryColor = Color(0xFF00E5FF); // Cyan/Teal accent
  static const Color secondaryColor = Color(0xFF651FFF); // Deep Purple accent
  
  // Dark Theme Colors
  static const Color darkBackgroundColor = Color(0xFF0A0E17);
  static const Color darkSurfaceColor = Color(0xFF131A2A);
  static const Color darkTextPrimary = Color(0xFFE2E8F0);
  static const Color darkTextSecondary = Color(0xFF94A3B8);

  // Light Theme Colors
  static const Color lightBackgroundColor = Color(0xFFF8FAFC);
  static const Color lightSurfaceColor = Color(0xFFFFFFFF);
  static const Color lightTextPrimary = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF475569);

  // Common Button Styles
  static ButtonStyle _elevatedButtonStyle(Color bg, Color fg) => ElevatedButton.styleFrom(
    backgroundColor: bg,
    foregroundColor: fg,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  static ButtonStyle _outlinedButtonStyle(Color fg, Color border) => OutlinedButton.styleFrom(
    foregroundColor: fg,
    side: BorderSide(color: border, width: 2),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackgroundColor,
      primaryColor: primaryColor,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: secondaryColor,
        surface: darkSurfaceColor,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.inter(color: darkTextPrimary, fontWeight: FontWeight.bold, fontSize: 56),
        displayMedium: GoogleFonts.inter(color: darkTextPrimary, fontWeight: FontWeight.bold, fontSize: 48),
        displaySmall: GoogleFonts.inter(color: darkTextPrimary, fontWeight: FontWeight.bold, fontSize: 36),
        headlineLarge: GoogleFonts.inter(color: darkTextPrimary, fontWeight: FontWeight.bold, fontSize: 32),
        headlineMedium: GoogleFonts.inter(color: darkTextPrimary, fontWeight: FontWeight.w600, fontSize: 28),
        headlineSmall: GoogleFonts.inter(color: darkTextPrimary, fontWeight: FontWeight.w600, fontSize: 24),
        titleLarge: GoogleFonts.inter(color: darkTextPrimary, fontWeight: FontWeight.w600, fontSize: 20),
        titleMedium: GoogleFonts.inter(color: darkTextPrimary, fontWeight: FontWeight.w500, fontSize: 16),
        bodyLarge: GoogleFonts.inter(color: darkTextPrimary, fontSize: 16, height: 1.5),
        bodyMedium: GoogleFonts.inter(color: darkTextSecondary, fontSize: 14, height: 1.5),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: _elevatedButtonStyle(primaryColor, darkBackgroundColor),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: _outlinedButtonStyle(primaryColor, primaryColor),
      ),
      cardTheme: CardThemeData(
        color: darkSurfaceColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.white.withValues(alpha: 0.05), width: 1),
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightBackgroundColor,
      primaryColor: primaryColor,
      colorScheme: const ColorScheme.light(
        primary: secondaryColor, // Use deep purple for better contrast in light mode
        secondary: primaryColor,
        surface: lightSurfaceColor,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.inter(color: lightTextPrimary, fontWeight: FontWeight.bold, fontSize: 56),
        displayMedium: GoogleFonts.inter(color: lightTextPrimary, fontWeight: FontWeight.bold, fontSize: 48),
        displaySmall: GoogleFonts.inter(color: lightTextPrimary, fontWeight: FontWeight.bold, fontSize: 36),
        headlineLarge: GoogleFonts.inter(color: lightTextPrimary, fontWeight: FontWeight.bold, fontSize: 32),
        headlineMedium: GoogleFonts.inter(color: lightTextPrimary, fontWeight: FontWeight.w600, fontSize: 28),
        headlineSmall: GoogleFonts.inter(color: lightTextPrimary, fontWeight: FontWeight.w600, fontSize: 24),
        titleLarge: GoogleFonts.inter(color: lightTextPrimary, fontWeight: FontWeight.w600, fontSize: 20),
        titleMedium: GoogleFonts.inter(color: lightTextPrimary, fontWeight: FontWeight.w500, fontSize: 16),
        bodyLarge: GoogleFonts.inter(color: lightTextPrimary, fontSize: 16, height: 1.5),
        bodyMedium: GoogleFonts.inter(color: lightTextSecondary, fontSize: 14, height: 1.5),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: _elevatedButtonStyle(secondaryColor, lightSurfaceColor),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: _outlinedButtonStyle(secondaryColor, secondaryColor),
      ),
      cardTheme: CardThemeData(
        color: lightSurfaceColor,
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.black.withValues(alpha: 0.05), width: 1),
        ),
      ),
    );
  }
}
