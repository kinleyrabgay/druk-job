import 'package:druk_job/utils/constants/colors.dart';
import 'package:druk_job/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
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

      // Show loader or circular progress indicator
      home: const Scaffold(
        backgroundColor: DJColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
