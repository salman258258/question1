import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/controllers/shared_controller.dart';
import 'app/routes/app_routes.dart';
import 'app/screens/first_screen.dart';
import 'app/screens/second_screen.dart';
import 'app/screens/third_screen.dart';

void main() {
  Get.put(SharedController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Palindrome & Users (GetX)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.first,
      getPages: [
        GetPage(name: AppRoutes.first, page: () => const FirstScreen()),
        GetPage(name: AppRoutes.second, page: () => const SecondScreen()),
        GetPage(name: AppRoutes.third, page: () => const ThirdScreen()),
      ],
    );
  }
}
