import 'package:druk_job/features/onboarding/controller/_onboarding.controller.dart';
import 'package:druk_job/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: DJDeviceUtils.getAppBarHeight() - 15,
      right: 0,
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () {
          OnboardingController.instace.skipPage();
        },
        child: const Text(
          'Skip',
        ),
      ),
    );
  }
}
