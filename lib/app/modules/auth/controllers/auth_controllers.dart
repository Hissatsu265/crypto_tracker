import 'package:crypto_tracker/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../data/providers/auth_provider.dart';
import '../../../data/models/user_model.dart';

class AuthController extends GetxController {
  final AuthProvider authProvider;
  final _user = Rx<UserModel?>(null);
  final _isLoading = false.obs;

  AuthController({required this.authProvider});

  UserModel? get user => _user.value;
  bool get isLoading => _isLoading.value;

  Future<void> login(String email, String password) async {
    try {
      _isLoading.value = true;
      final userCredential = await authProvider.signInWithEmailAndPassword(email, password);
      final token = await userCredential.user?.getIdToken();
      
      if (token != null) {
        final userData = await authProvider.getUserProfile(token);
        _user.value = UserModel.fromJson(userData);
        Get.offAllNamed(Routes.HOME);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> register(String email, String password) async {
    try {
      _isLoading.value = true;
      await authProvider.register(email, password);
      Get.snackbar('Success', 'Registration successful');
      Get.toNamed(Routes.LOGIN);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      _isLoading.value = false;
    }
  }
}
