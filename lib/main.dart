import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/app_theme.dart';
import 'views/home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Jamil Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomePage(),
      defaultTransition: Transition.fadeIn,
    );
  }
}
