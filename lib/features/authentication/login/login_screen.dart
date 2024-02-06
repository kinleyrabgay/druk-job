import 'package:druk_job/common/widgets/divider.dart';
import 'package:druk_job/common/widgets/text_header.dart';
import 'package:druk_job/features/authentication/login/widgets/_login.form.dart';
import 'package:druk_job/features/authentication/login/widgets/_social.button.dart';
import 'package:druk_job/utils/constants/colors.dart';
import 'package:druk_job/utils/constants/sizes.dart';
import 'package:druk_job/utils/constants/text.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: DJColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(DJSizes.defaultSpace),
            child: Column(
              children: [
                // Email Header
                DJTextHeader(
                  title: DJTextString.authEmailTitle,
                  subTitle: DJTextString.authEmailSubTitle,
                ),
                SizedBox(height: DJSizes.spaceBtwSections),

                // --- Login Form
                LoginForm(),
                SizedBox(height: DJSizes.spaceBtwSections),

                // --- Divider
                DJDivider(divierText: DJTextString.orSignInWith),
                SizedBox(height: DJSizes.spaceBtwSections),

                // --- Social Button
                SocialButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
