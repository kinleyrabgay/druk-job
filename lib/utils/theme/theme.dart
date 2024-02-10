import 'package:druk_job/utils/constants/colors.dart';
import 'package:druk_job/utils/theme/custom/app_bar.dart';
import 'package:druk_job/utils/theme/custom/bottom_sheet.dart';
import 'package:druk_job/utils/theme/custom/checkbox.dart';
import 'package:druk_job/utils/theme/custom/chip.dart';
import 'package:druk_job/utils/theme/custom/elevated_button.dart';
import 'package:druk_job/utils/theme/custom/outlined_button.dart';
import 'package:druk_job/utils/theme/custom/text_field.dart';
import 'package:druk_job/utils/theme/custom/text_theme.dart';
import 'package:flutter/material.dart';

class DJAppTheme {
  const DJAppTheme._();

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: DJTextTheme.lightTextTheme,
    chipTheme: DJChipTheme.lightChipTheme,
    scaffoldBackgroundColor: DJColors.white,
    appBarTheme: DJAppBarTheme.lightAppBarTheme,
    checkboxTheme: DJCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: DJBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: DJElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: DJOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: DJTextFieldTheme.lightInputDecorationTheme,
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: DJTextTheme.darkTextTheme,
    chipTheme: DJChipTheme.darkChipTheme,
    scaffoldBackgroundColor: DJColors.dark,
    appBarTheme: DJAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: DJBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: DJCheckboxTheme.darkCheckboxTheme,
    elevatedButtonTheme: DJElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: DJOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: DJTextFieldTheme.darkInputDecorationTheme,
  );
}
