import 'package:druk_job/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class GeneralInfo extends StatelessWidget {
  const GeneralInfo({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: DJSizes.spaceBtwItems / 2),
        Container(
          constraints: const BoxConstraints(
            maxHeight: double.infinity,
          ),
          child: TextFormField(
            maxLines: null,
            initialValue: value,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              // hintText: value,
              hintStyle: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
      ],
    );
  }
}
