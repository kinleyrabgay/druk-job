import 'package:druk_job/features/onboarding/controller/onboarding_controller.dart';
import 'package:druk_job/features/onboarding/screen/widgets/onboarding_navigation.dart';
import 'package:druk_job/features/onboarding/screen/widgets/onboarding_next_button.dart';
import 'package:druk_job/features/onboarding/screen/widgets/onboarding_page.dart';
import 'package:druk_job/features/onboarding/screen/widgets/onboarding_skip.dart';
import 'package:druk_job/utils/constants/image.dart';
import 'package:druk_job/utils/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          // Scroll Page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingPage(
                image: DJImageString.onboardingImage1,
                title: DJTextString.onBoardingTitle1,
                subtitle: DJTextString.onBoardingSubTitle1,
              ),
              OnboardingPage(
                image: DJImageString.onboardingImage2,
                title: DJTextString.onBoardingTitle2,
                subtitle: DJTextString.onBoardingSubTitle2,
              ),
              OnboardingPage(
                image: DJImageString.onboardingImage3,
                title: DJTextString.onBoardingTitle3,
                subtitle: DJTextString.onBoardingSubTitle3,
              )
            ],
          ),

          // Skip button
          const OnboardingSkip(),

          // Dot naviation
          const OnboardingDotNavigation(),

          // circular button
          const OnboardingNextButton()
        ],
      ),
    );
  }
}
