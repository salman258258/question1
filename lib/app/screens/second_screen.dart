import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/shared_controller.dart';
import '../routes/app_routes.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SharedController sharedController = Get.find<SharedController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen'),centerTitle: true,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text(
      'Welcome',
      style: TextStyle(
        fontSize: 14,
      ),
    ),

    const SizedBox(height: 8),

    Obx(
      () => Text(
        sharedController.name.value.isEmpty
            ? "-"
            : sharedController.name.value,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

     const Spacer(),

    Center(
      child: Obx(
        () => Text(
          sharedController.selectedUserName.value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),

    const Spacer(),

    SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2B637B),
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () => Get.toNamed(AppRoutes.third),
        child: const Text('Choose a User'),
      ),
    ),
  ],
)
        ),
      ),
    );
  }
}
