import 'package:druk_job/common/widgets/circular.image.dart';
import 'package:druk_job/common/widgets/cover.picture.dart';
import 'package:druk_job/common/widgets/shimmer.dart';
import 'package:druk_job/features/personalization/controller/user.controller.dart';
import 'package:druk_job/utils/constants/image.dart';
import 'package:druk_job/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            children: [
              // Profile
              ProfilePhoto(controller: controller),
            ],
          ),
        ),
      ),
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
        Obx(() {
          final networkImage = controller.user.value.coverPhoto;
          final image =
              networkImage.isNotEmpty ? networkImage : DJImageString.homeIcon;

          return controller.imageUploading.value
              ? const DJShimmerEffect(
                  width: 80,
                  height: 80,
                  radius: 80,
                )
              : DJCoverPhoto(
                  image: image,
                  isNetworkImage: networkImage.isNotEmpty,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  border: 20,
                  onTap: () => controller.uploadUserProfilePicture(),
                );
        }),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.15,
          left: 0,
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
              //   onPressed: () =>
              //       controller.uploadUserProfilePicture(),
              //   child: const Text('Change Profile Picture'),
              // )
            ],
          ),
        ),
      ],
    );
  }
}
