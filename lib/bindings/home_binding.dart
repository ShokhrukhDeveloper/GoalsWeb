import 'package:get/get.dart';
import '../controllers/home/home_controller.dart';
class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}