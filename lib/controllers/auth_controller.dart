import 'package:flutter/cupertino.dart';
import 'package:goals_web/_imports.dart';

import 'base_controller.dart';

class AuthController extends BaseController {
  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordAgain = TextEditingController();
  ApiClient apiClient = ApiClient.getInstance;
  Future<void> signUp() async {
    if (login.text.length != 13) {
      Get.snackbar("Login kiritishda xatolik", "login 14 xonali son bo'lsin",
          colorText: AppColors.red);
      return;
    }
    if (password.text.length <= 4) {
      Get.snackbar("Parol kiritishda xatolik", "parol kamida 5 belgindan ko'p",
          colorText: AppColors.red);
      return;
    }
    if (password.text  != passwordAgain.text) {
      Get.snackbar("Parolni qayta kiritishda xatolik", "parolni tekshirib qaytdan kiriting",
          colorText: AppColors.red);
      return;
    }
    var response =await apiClient.createUser(
        {   "password": password.text,
            "full_name": "New User",
            "phone": login.text});
    print(response.statusCode);
    print(response.body);
    if(response.isSuccessful)
      {
        Get.snackbar("Muvoffaqiyatli ro'yhatdan o'tildi", "");
      }
  }
  Future<void> signIn() async {
    if (login.text.length != 13) {
      Get.snackbar("Login kiritishda xatolik", "login 14 xonali son bo'lsin",
          colorText: AppColors.red);
      return;
    }
    if (password.text.length <= 4) {
      Get.snackbar("Parol kiritishda xatolik", "parol kamida 5 belgindan ko'p",
          colorText: AppColors.red);
      return;
    }

    var response =await apiClient.login(
        {   "password": password.text,
            "login": login.text});
    print(response.statusCode);
    print(response.body);
    if(response.isSuccessful)
      {
        Get.snackbar("Muvoffaqiyatli ro'yhatdan o'tildi", "");
      }
  }
}
