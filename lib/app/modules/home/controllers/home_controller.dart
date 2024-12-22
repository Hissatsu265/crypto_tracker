import 'package:get/get.dart';
import '../../../data/providers/auth_provider.dart';

class HomeController extends GetxController {
  final AuthProvider authProvider;
  final _userEmail = ''.obs;

  HomeController({required this.authProvider});

  String get userEmail => _userEmail.value;

  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
  }

  Future<void> loadUserProfile() async {
    try {
      final user = await authProvider.getCurrentUser();
      if (user != null) {
        _userEmail.value = user.email ?? '';
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void logout() async {
    try {
      await authProvider.signOut();
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}