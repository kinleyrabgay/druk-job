import 'package:druk_job/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hey, Welcome Back!'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DJSizes.defaultSpace),
        child: Column(
          children: [Text('Hello')],
        ),
      ),
    );
  }
}
