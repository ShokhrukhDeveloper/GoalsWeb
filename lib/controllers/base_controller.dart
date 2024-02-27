import 'package:get/get.dart';
export 'package:get/get.dart';

abstract class BaseController extends GetxController {
  Rx<bool> _isLoading = false.obs;

  void setLoading(Rx<bool> value) {
    _isLoading = value;
    update();
  }

  Rx<bool> get isLoading => _isLoading;
}