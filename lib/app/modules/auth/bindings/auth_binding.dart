import 'package:crypto_tracker/app/modules/auth/controllers/auth_controllers.dart';
import 'package:get/get.dart';
import '../../../data/providers/auth_provider.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<AuthController>(
      () => AuthController(authProvider: Get.find()),
    );
  }
}