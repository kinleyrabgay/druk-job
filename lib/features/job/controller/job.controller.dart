import 'package:druk_job/data/repositories/user/user.repository.dart';
import 'package:get/get.dart';

class JobController extends GetxController {
  static JobController get instance => Get.find();

  final profileLoading = false.obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
  }
}
