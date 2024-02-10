import 'package:druk_job/common/widgets/text_header.dart';
import 'package:druk_job/features/authentication/register/widgets/_register.form.dart';
import 'package:druk_job/utils/constants/colors.dart';
import 'package:druk_job/utils/constants/sizes.dart';
import 'package:druk_job/utils/constants/text.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DJColors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: DJSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Email Header
              DJTextHeader(
                title: DJTextString.createPasswordTitle,
                subTitle: DJTextString.createPasswordSubTitle,
              ),
              SizedBox(height: DJSizes.spaceBtwSections),

              // --- Sign Form
              RegisterForm()
            ],
          ),
        ),
      ),
    );
  }
}
