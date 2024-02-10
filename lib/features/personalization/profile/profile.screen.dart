import 'package:druk_job/common/widgets/circular.image.dart';
import 'package:druk_job/common/widgets/shimmer.dart';
import 'package:druk_job/features/personalization/controller/user.controller.dart';
import 'package:druk_job/features/personalization/profile/widgets/_info.general.dart';
import 'package:druk_job/utils/constants/colors.dart';
import 'package:druk_job/utils/constants/image.dart';
import 'package:druk_job/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: DJSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Info
              Container(
                color: DJColors.accent,
                child: ListTile(
                  leading: const Icon(Iconsax.info_circle),
                  subtitle: Text(
                    'Keep your profile up to date, this will be shared with the employeers',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ),
              const SizedBox(height: DJSizes.spaceBtwItems),

              // Profile
              ProfilePhoto(controller: controller),
              const SizedBox(height: DJSizes.spaceBtwSections * 2),

              GeneralInformation(controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}

class GeneralInformation extends StatelessWidget {
  const GeneralInformation({
    super.key,
    required this.controller,
  });

  final UserController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // General Information
        Text(
          'General Information',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .apply(decoration: TextDecoration.underline),
        ),
        const SizedBox(height: DJSizes.spaceBtwItems),

        GeneralInfo(
          title: 'First Name',
          value: controller.user.value.firstName,
        ),
        const SizedBox(height: DJSizes.spaceBtwItems),
        GeneralInfo(
          title: 'Last Name',
          value: controller.user.value.lastName,
        ),
        const SizedBox(height: DJSizes.spaceBtwItems),
        const GeneralInfo(
          title: 'Short Bio',
          value: "",
        ),
      ],
    );
  }
}

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
    required this.controller,
  });

  final UserController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          color: DJColors.accent,
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.05,
          left: 20,
          child: Column(
            children: [
              Obx(() {
                final networkImage = controller.user.value.profilePicture;
                final image = networkImage.isNotEmpty
                    ? networkImage
                    : DJImageString.homeIcon;

                return controller.imageUploading.value
                    ? const DJShimmerEffect(
                        width: 80,
                        height: 80,
                        radius: 80,
                      )
                    : DJCircularImage(
                        image: image,
                        isNetworkImage: networkImage.isNotEmpty,
                        width: 80,
                        height: 80,
                        border: 80,
                        onTap: () => controller.uploadUserProfilePicture(),
                      );
              }),
              // TextButton(
              //   onPressed: () => controller.uploadUserProfilePicture(),
              //   child: const Text('Change Profile Picture'),
              // )
            ],
          ),
        ),
      ],
    );
  }
}
