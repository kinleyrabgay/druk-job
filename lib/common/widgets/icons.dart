import 'package:druk_job/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DJIconImage extends StatelessWidget {
  const DJIconImage({
    Key? key,
    required this.image,
    this.index,
    this.isSelected = false,
  }) : super(key: key);

  final String image;
  final int? index;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: 25,
      width: 25,
      color:
          isSelected ? DJColors.primary : DJColors.darkerGrey.withOpacity(0.4),
    );
  }
}
