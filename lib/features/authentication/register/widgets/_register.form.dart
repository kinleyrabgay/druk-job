import 'package:druk_job/features/authentication/register/controller/_register.controller.dart';
import 'package:druk_job/utils/constants/colors.dart';
import 'package:druk_job/utils/constants/sizes.dart';
import 'package:druk_job/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Form(
      key: controller.passwordFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //--- Create Password
          Text(
            'Create Password',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: DJSizes.spaceBtwItems / 2),
          Obx(
            () => TextFormField(
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              validator: (value) => DJValidator.validatePassword(value),
              decoration: InputDecoration(
                border:
                    const OutlineInputBorder(borderRadius: BorderRadius.zero),
                suffixIcon: IconButton(
                  icon: controller.hidePassword.value
                      ? const Icon(Iconsax.eye_slash)
                      : const Icon(Iconsax.eye),
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                ),
                hintText: 'youremail@email.xyz',
                hintStyle: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),

          const SizedBox(height: DJSizes.spaceBtwInputFields * 2),

          //--- Confirm Password
          Text(
            'Confirm Password',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: DJSizes.spaceBtwItems / 2),
          Obx(
            () => TextFormField(
              controller: controller.confirmPassword,
              obscureText: controller.hideConfirmPassword.value,
              validator: (value) => DJValidator.validatePasswordConfirm(
                  value, controller.password.text),
              decoration: InputDecoration(
                border:
                    const OutlineInputBorder(borderRadius: BorderRadius.zero),
                suffixIcon: IconButton(
                  icon: controller.hideConfirmPassword.value
                      ? const Icon(Iconsax.eye_slash)
                      : const Icon(Iconsax.eye),
                  onPressed: () => controller.hideConfirmPassword.value =
                      !controller.hideConfirmPassword.value,
                ),
                hintText: 'youremail@email.xyz',
                hintStyle: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
          const SizedBox(height: DJSizes.spaceBtwSections),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
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
