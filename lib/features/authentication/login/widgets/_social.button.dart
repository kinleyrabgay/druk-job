import 'package:druk_job/features/authentication/login/controller/_login.controller.dart';
import 'package:druk_job/utils/constants/colors.dart';
import 'package:druk_job/utils/constants/image.dart';
import 'package:druk_job/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => controller.googleSignIn(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  width: DJSizes.iconMd,
                  height: DJSizes.iconMd,
                  image: AssetImage(DJImageString.goggle),
                ),
                const SizedBox(width: DJSizes.spaceBtwItems),
                Text(
                  'Continue with Google',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: DJColors.black),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: DJSizes.spaceBtwItems),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  width: DJSizes.iconMd,
                  height: DJSizes.iconMd,
                  image: AssetImage(DJImageString.facebook),
                ),
                const SizedBox(width: DJSizes.spaceBtwItems),
                Text(
                  'Continue with Facebook',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: DJColors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
