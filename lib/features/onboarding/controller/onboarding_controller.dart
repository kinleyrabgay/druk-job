import 'package:druk_job/features/authentication/register/register_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instace => Get.find();

  // Variables
  final pageController = PageController();

  // Rx<int> currentPageIndex = 0.obs;
  final currentPageIndex = 0.obs;

  // Update Current Index when Page Scroll
  void updatePageIndicator(index) {
    currentPageIndex.value = index;
  }

  // Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Update current index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final deviceStorage = GetStorage();
      deviceStorage.write('isFirstTime', false);
      Get.offAll(() => const RegisterScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Update current index & jump to the last
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
