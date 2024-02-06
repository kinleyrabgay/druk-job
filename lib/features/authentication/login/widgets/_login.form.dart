import 'package:druk_job/features/authentication/login/controller/_login.controller.dart';
import 'package:druk_job/utils/constants/colors.dart';
import 'package:druk_job/utils/constants/sizes.dart';
import 'package:druk_job/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Email',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: DJSizes.spaceBtwItems / 2),
          TextFormField(
            controller: controller.email,
            validator: (value) => DJValidator.validateEmail(value),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
              ),
              hintText: 'youremail@email.xyz',
              hintStyle: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          const SizedBox(height: DJSizes.spaceBtwSections),
          // Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () =>
                  controller.redirectAuthScreen(controller.email.text),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Next', style: TextStyle(color: DJColors.white)),
                  SizedBox(width: DJSizes.spaceBtwItems),
                  Icon(Iconsax.arrow_right_1)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
