import 'package:druk_job/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DJChipTheme {
  DJChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: DJColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: DJColors.black),
    selectedColor: DJColors.black,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: DJColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: DJColors.darkerGrey,
    labelStyle: TextStyle(color: DJColors.white),
    selectedColor: DJColors.black,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: DJColors.white,
  );
}
