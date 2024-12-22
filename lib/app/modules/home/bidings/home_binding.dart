import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../data/providers/auth_provider.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<HomeController>(
      () => HomeController(authProvider: Get.find()),
    );
  }
}
