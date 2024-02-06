import 'package:druk_job/common/widgets/animation_loader.dart';
import 'package:druk_job/utils/constants/colors.dart';
import 'package:druk_job/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        child: Container(
          color: DJHelperFunctions.isDarkMode(Get.context!)
              ? DJColors.dark
              : DJColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              DJAnimationLoader(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
