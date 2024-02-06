// ---------------- Login Controller -------------------------------
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:druk_job/common/network/network_manager.dart';
import 'package:druk_job/data/repositories/authentication.dart';
import 'package:druk_job/features/authentication/login/_login.authenticate.dart';
import 'package:druk_job/features/authentication/register/register_screen.dart';
import 'package:druk_job/features/personalization/controller/user.controller.dart';
import 'package:druk_job/utils/constants/image.dart';
import 'package:druk_job/utils/loader/loader.dart';
import 'package:druk_job/utils/popup/popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Variable
  // --- Email
  final hidePassword = false.obs;
  final rememberMe = false.obs;
  final disableButton = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // --- Storage
  final localStorage = GetStorage();

  // --- Controller
  final userController = Get.put(UserController());

  // ----- Init --------
  @override
  void onInit() {
    // ---- Read storage for (E & P)
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> redirectAuthScreen(String email) async {
    // --- Check for internet
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      return;
    }

    // --- Form
    if (!loginFormKey.currentState!.validate()) return;

    //--- Email exist ? redirect to login else to register
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (query.docs.isEmpty) {
      // --- Go to the sign up screen
      Get.to(() => const RegisterScreen());
    } else {
      // --- Go to the login screen
      Get.to(() => LoginAuthenticate(email: email));
    }
  }

  // ----- Google Login ------------------
  Future<void> googleSignIn() async {
    try {
      // --- Loading
      DJFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        DJImageString.loading,
      );

      // --- Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        DJFullScreenLoader.stopLoading();
        return;
      }

      // --- Google auth
      final userCredentials =
          await AuthenticationRepository.instance.signInWIthGoogle();

      // --- Save user records
      await userController.saveUserRecord(userCredentials);

      // --- Remove loader
      DJFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      DJFullScreenLoader.stopLoading();
      DJLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // ----- Facebook Login ------------------
  Future<void> facebookSignIn() async {}
}
