import 'package:druk_job/features/authentication/login/login_screen.dart';
import 'package:druk_job/features/onboarding/screen/onboarding_screen.dart';
import 'package:druk_job/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  // Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => const NavigationMenu());
      }
    } else {
      if (kDebugMode) {
        print("============ GET STOREAGE ===============");
        print(deviceStorage.read('isFirstTime'));
      }

      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnboardingScreen());
    }
  }

  // --- Google Sign-In
  Future<UserCredential?> signInWIthGoogle() async {
    try {
      // --- Trigger the auth flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // --- Create a new credentials
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // --- Once signed in, return the UserCredentials
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw 'Error $e.code';
    } on FirebaseException catch (e) {
      // --- throw TFirebaseException(e.code).message;
      throw 'Error $e';
    } on FormatException catch (_) {
      // throw const TFormatException();
      throw 'Error!';
    } on PlatformException catch (e) {
      // throw TargetPlatformException(e.code).message;
      throw 'Error $e';
    } catch (e) {
      // throw 'Something went wrong, Please try again';
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }
}
