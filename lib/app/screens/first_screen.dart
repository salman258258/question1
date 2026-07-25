import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: null,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/profile.png',
                      width: 116,
                      height: 116,
                      fit: BoxFit.contain,
                      semanticLabel: 'Profile',
                    ),
                  ),
              
              
                  const SizedBox(height: 36),
                  _InputField(
                    controller: controller.nameController,
                    label: 'Name',
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  _InputField(
                    controller: controller.sentenceController,
                    label: 'Palindrome',
                    hint: 'e.g. "step on no pets"',
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: controller.checkPalindrome,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: const Color(0xFF2B637B),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text('Check'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: controller.goToNext,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: const Color(0xFF2B637B),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text('Next'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.controller,
    required this.label,
    required this.textInputAction,
    this.hint,
  });

  final TextEditingController controller;
  final String label;
  final String? hint;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: controller,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
