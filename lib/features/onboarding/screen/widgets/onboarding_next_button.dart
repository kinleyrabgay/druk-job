import 'package:druk_job/features/onboarding/controller/onboarding_controller.dart';
import 'package:druk_job/utils/constants/colors.dart';
import 'package:druk_job/utils/constants/sizes.dart';
import 'package:druk_job/utils/device/device_utility.dart';
import 'package:druk_job/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = DJHelperFunctions.isDarkMode(context);
    return Positioned(
      right: DJSizes.defaultSpace,
      bottom: DJDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () {
          OnboardingController.instace.nextPage();
        },
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? DJColors.primary : DJColors.black),
        child: const Icon(
          CupertinoIcons.arrow_right,
          color: Colors.white,
        ),
      ),
    );
  }
}
