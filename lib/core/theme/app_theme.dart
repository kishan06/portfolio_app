import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFF06F9F9); // Neon Cyan
  static const Color backgroundDark = Color(
    0xFF0F2323,
  ); // Deep Charcoal/Greenish
  static const Color charcoal = Color(0xFF121212);
  static const Color navy = Color(0xFF1A1A2E);
  static const Color glass = Color(0x991A1A2E); // 60% opacity
  static const Color textLight = Color(0xFFF5F8F8);
  static const Color textDim = Color(0xFFABBBC2);
  static const Color textPrimary = textLight;
}

class AppTextStyles {
  static TextStyle get displayLarge => GoogleFonts.inter(
    fontSize: 56,
    fontWeight: FontWeight.w800,
    color: AppColors.textLight,
    height: 1.1,
  );

  static TextStyle get displayMedium => GoogleFonts.inter(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: AppColors.textLight,
    height: 1.2,
  );

  static TextStyle get headline => GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textLight,
  );

  static TextStyle get bodyLarge => GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: AppColors.textDim,
    height: 1.6,
  );

  static TextStyle get bodyMedium => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textDim,
    height: 1.5,
  );

  static TextStyle get label => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    letterSpacing: 0.5,
  );
}

class AppTheme {
  static ThemeData get darkTheme => ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.backgroundDark,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.navy,
      surface: AppColors.charcoal,
      background: AppColors.backgroundDark,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.displayLarge,
      displayMedium: AppTextStyles.displayMedium,
      headlineSmall: AppTextStyles.headline,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      labelLarge: AppTextStyles.label,
    ),
  );
}
