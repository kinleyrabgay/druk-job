import 'package:druk_job/common/bindings/general_binding.dart';
import 'package:druk_job/data/repositories/authentication.dart';
import 'package:druk_job/firebase_options.dart';
import 'package:druk_job/utils/constants/colors.dart';
import 'package:druk_job/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  // Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Initialize storage
  await GetStorage.init();

  // Native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Status bar color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  // Intialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Druk Job',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: DJAppTheme.darkTheme,
      theme: DJAppTheme.lightTheme,

      // Binding
      initialBinding: GeneralBindings(),

      // Show loader or circular progress indicator
      home: const Scaffold(
        backgroundColor: DJColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
