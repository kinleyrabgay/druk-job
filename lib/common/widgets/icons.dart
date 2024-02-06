import 'package:flutter/material.dart';

class DJIconImage extends StatelessWidget {
  const DJIconImage({
    Key? key,
    required this.image,
    this.index,
    this.currentIndex,
    this.isSelected = false,
  }) : super(key: key);

  final String image;
  final int? index;
  final int? currentIndex;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: 25,
      width: 25,
      // color: index == currentIndex ? const Color(0xfffe416c) : Colors.black,
      color:
          isSelected ? const Color(0xfffe416c) : Colors.black.withOpacity(0.4),
    );
  }
}
