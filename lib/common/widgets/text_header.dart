import 'package:druk_job/utils/constants/colors.dart';
import 'package:druk_job/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DJTextHeader extends StatelessWidget {
  const DJTextHeader({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: DJSizes.sm),
        Text(
          subTitle,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .apply(color: DJColors.darkGrey),
        ),
      ],
    );
  }
}
