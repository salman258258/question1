import 'package:get/get.dart';
import '../data/models/user_model.dart';
import '../data/services/api_service.dart';
import 'shared_controller.dart';

class UserController extends GetxController {
  final ApiService _apiService = ApiService();
  final SharedController _sharedController = Get.find<SharedController>();

  final RxList<UserModel> users = <UserModel>[].obs;

  final RxBool isLoading = false.obs; // first load
  final RxBool isRefreshing = false.obs; // pull to refresh
  final RxBool isLoadingMore = false.obs; // pagination
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;

  static const int perPage = 10;
  int _currentPage = 1;
  int _totalPages = 1;

  bool get hasMore => _currentPage < _totalPages;

  @override
  void onInit() {
    super.onInit();
    fetchInitial();
  }

  Future<void> fetchInitial() async {
    isLoading.value = true;
    hasError.value = false;
    try {
      final result = await _apiService.fetchUsers(page: 1, perPage: perPage);
      users.assignAll(result.data);
      _currentPage = result.page;
      _totalPages = result.totalPages;
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshUsers() async {
    isRefreshing.value = true;
    hasError.value = false;
    try {
      final result = await _apiService.fetchUsers(page: 1, perPage: perPage);
      users.assignAll(result.data);
      _currentPage = result.page;
      _totalPages = result.totalPages;
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
      if (users.isEmpty) {
        // keep empty state visible with error message
      } else {
        Get.snackbar('Error', 'Failed to refresh users');
      }
    } finally {
      isRefreshing.value = false;
    }
  }

  Future<void> loadMoreUsers() async {
    if (isLoadingMore.value || isLoading.value || !hasMore) return;

    isLoadingMore.value = true;
    try {
      final nextPage = _currentPage + 1;
      final result =
          await _apiService.fetchUsers(page: nextPage, perPage: perPage);
      users.addAll(result.data);
      _currentPage = result.page;
      _totalPages = result.totalPages;
    } catch (_) {
      Get.snackbar('Error', 'Failed to load more users');
    } finally {
      isLoadingMore.value = false;
    }
  }


  void selectUser(UserModel user) {
    _sharedController.setSelectedUser(user.fullName);
    Get.back();
  }
}
