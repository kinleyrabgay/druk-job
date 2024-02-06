import 'package:cached_network_image/cached_network_image.dart';
import 'package:druk_job/common/widgets/shimmer.dart';
import 'package:druk_job/utils/constants/colors.dart';
import 'package:druk_job/utils/constants/sizes.dart';
import 'package:druk_job/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class DJCircularImage extends StatelessWidget {
  const DJCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = DJSizes.sm,
    this.border = 80,
    this.onTap,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double border;
  final double width, height, padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(DJSizes.sm),
        decoration: BoxDecoration(
          color: DJHelperFunctions.isDarkMode(context)
              ? DJColors.black
              : DJColors.white,
          borderRadius: BorderRadius.circular(border),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(80),
          child: Center(
            child: isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: image,
                    fit: fit,
                    color: overlayColor,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            const DJShimmerEffect(
                      width: 80,
                      height: 80,
                      radius: 80,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image(
                    fit: fit,
                    image: isNetworkImage
                        ? NetworkImage(image)
                        : AssetImage(image) as ImageProvider,
                    color: overlayColor,
                  ),
          ),
        ),
      ),
    );
  }
}
