import 'package:druk_job/utils/constants/colors.dart';
import 'package:druk_job/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class DJDivider extends StatelessWidget {
  const DJDivider({
    super.key,
    required this.divierText,
  });

  final String divierText;

  @override
  Widget build(BuildContext context) {
    final isDark = DJHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: isDark ? DJColors.darkGrey : DJColors.grey,
            thickness: 0.5,
            // indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          divierText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: isDark ? DJColors.darkGrey : DJColors.grey,
            thickness: 0.5,
            indent: 5,
            // endIndent: 60,
          ),
        ),
      ],
    );
  }
}
