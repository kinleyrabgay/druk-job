import 'package:druk_job/utils/constants/colors.dart';
import 'package:druk_job/utils/constants/image.dart';
import 'package:druk_job/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class PageUnderConstruction extends StatelessWidget {
  const PageUnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image
        Center(child: Image.asset(DJImageString.emptyPage)),
        const SizedBox(height: DJSizes.spaceBtwSections),
        Text(
          'You have not created any Organizations yet',
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),

        ElevatedButton(
            onPressed: () {},
            child: Text(
              'Create Organization',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: DJColors.white),
            )),

        // Button
      ],
    );
  }
}
