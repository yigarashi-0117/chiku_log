import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color primary = Color.fromARGB(255, 77, 200, 188);
  static const Color secondary = Color(0xFF000000);
  static const Color background = Color(0xFF000000);
  static const Color text = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF000000);
  static const Color textTertiary = Color(0xFF000000);
  static const Color textQuaternary = Color(0xFF000000);

  static const black1 = Color(0xFF101010);
  static const white1 = Color(0xFFFFFFFF);
  static const grey1 = Color(0xFFF2F2F2);
  static const grey2 = Color(0xFF4D4D4D);
  static const grey3 = Color(0xFFA4A4A4);
  static const whiteTransparent = Color(
    0x4DFFFFFF,
  ); // Figma rgba(255, 255, 255, 0.3)
  static const blackTransparent = Color(0x4D000000);
  static const red1 = Color(0xFFE74C3C);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.white1,
    secondary: AppColors.black1,
    onSecondary: AppColors.white1,
    surface: AppColors.grey1,
    onSurface: AppColors.black1,
    surfaceContainer: AppColors.white1,
    error: Colors.white,
    onError: Colors.red,
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.white1,
    onPrimary: AppColors.black1,
    secondary: AppColors.white1,
    onSecondary: AppColors.black1,
    surface: AppColors.black1,
    onSurface: Colors.white,
    error: Colors.black,
    onError: AppColors.red1,
  );
}
