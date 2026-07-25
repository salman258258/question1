import 'package:get/get.dart';


class SharedController extends GetxController {
  final RxString name = ''.obs;
  final RxString selectedUserName = '-'.obs;

  void setName(String value) => name.value = value;

  void setSelectedUser(String value) => selectedUserName.value = value;
}
