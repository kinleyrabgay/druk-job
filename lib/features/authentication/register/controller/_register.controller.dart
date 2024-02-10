// ---------------- Login Controller -------------------------------
import 'package:druk_job/common/network/network_manager.dart';
import 'package:druk_job/utils/popup/popup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  // Variable
  // ------ Obscure Password -------
  final hidePassword = false.obs;
  final hideConfirmPassword = false.obs;

  //--- Password -----------
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  // ----- Storage -------
  final localStorage = GetStorage();

  // --- Privacy & Policy
  final privacyPolicyCheck = false.obs;

  // ----- Init --------
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // ----- Email & Password Login ------------------
  Future<void> signIn() async {
    if (kDebugMode) {
      print('Called signIn');
    }
    // --- Start loading
    // FAFullScreenLoader.openLoadingDialog('We are trying you log you in...', animation)

    // --- Check internet connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      DJFullScreenLoader.stopLoading();
      return;
    }
  }

  // ----- Google Login ------------------
  Future<void> googleSignIn() async {}

  // ----- Facebook Login ------------------
  Future<void> facebookSignIn() async {}
}
