import 'package:druk_job/common/widgets/under.construction.dart';
import 'package:druk_job/utils/constants/colors.dart';
import 'package:druk_job/utils/constants/image.dart';
import 'package:druk_job/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrganizationScreen extends StatelessWidget {
  const OrganizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organization'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: DJSizes.defaultSpace),
          child: Column(
            children: [
              PageUnderConstruction(),
            ],
          ),
        ),
      ),
    );
  }
}
