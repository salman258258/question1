import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../utils/palindrome_helper.dart';
import 'shared_controller.dart';

class HomeController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sentenceController = TextEditingController();

  final SharedController _sharedController = Get.find<SharedController>();

  void checkPalindrome() {
    final sentence = sentenceController.text.trim();

    if (sentence.isEmpty) {
      Get.snackbar('Oops', 'Lengkapi Dulu Fieldnya');
      return;
    }

    final result = isPalindrome(sentence);

    Get.dialog(
      AlertDialog(
        title: const Text('Result'),
        content: Text(result ? 'isPalindrome' : 'not palindrome'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void goToNext() {
    _sharedController.setName(nameController.text.trim());
    Get.toNamed(AppRoutes.second);
  }

  @override
  void onClose() {
    nameController.dispose();
    sentenceController.dispose();
    super.onClose();
  }
}
