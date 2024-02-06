import 'package:druk_job/utils/constants/colors.dart';
import 'package:druk_job/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginAuthenticate extends StatelessWidget {
  const LoginAuthenticate({
    super.key,
    this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DJColors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(DJSizes.defaultSpace),
            child: Column(
              children: [
                // Email Header
              ],
            ),
          ),
        ),
      ),
    );
  }
}
