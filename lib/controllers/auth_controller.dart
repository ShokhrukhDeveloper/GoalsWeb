import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:goals_web/_imports.dart';
import 'package:goals_web/core/data_models/session.dart';
import 'package:goals_web/core/data_models/user_model.dart';
import 'package:goals_web/core/storage/local_storage.dart';

import 'base_controller.dart';

class AuthController extends BaseController {
  static Rx<UserModel?> userModel = Rx<UserModel?>(null);
  var singIn = true.obs;
  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordAgain = TextEditingController();
  ApiClient apiClient = ApiClient.getInstance;
  Future<void> signUp() async {
    if (login.text.length != 13) {
      Get.snackbar("Login kiritishda xatolik", "login 14 xonali son bo'lsin",
          colorText: AppColors.green);
      return;
    }
    if (password.text.length <= 4) {
      Get.snackbar("Parol kiritishda xatolik", "parol kamida 5 belgindan ko'p",
          colorText: AppColors.green);
      return;
    }
    if (password.text != passwordAgain.text) {
      Get.snackbar("Parolni qayta kiritishda xatolik",
          "parolni tekshirib qaytdan kiriting",
          colorText: AppColors.green);
      return;
    }

    var response = await apiClient.createUser({
      "password": password.text,
      "full_name": "New User",
      "phone": login.text
    });
    debugPrint(response.statusCode.toString());
    debugPrint(response.body.toString());
    if (response.isSuccessful) {
      await Future.delayed(const Duration(seconds: 2));
      Get.snackbar("Muvoffaqiyatli ro'yhatdan o'tildi", "",
          maxWidth: 400, colorText: AppColors.green);
      signIn();
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
    isLoading.value = true;
    var response =
        await apiClient.login({"password": password.text, "login": login.text});
    debugPrint(response.statusCode.toString());
    if (kDebugMode) {
      print(response.body);
    }
    if (response.isSuccessful) {
      var session = Session.fromJson(response.body);
      LocalStorage.sessionMap = response.body;
      LocalStorage.accessToken = session.accessToken;
      await Future.delayed(const Duration(seconds: 2));
      getAccountDetail().then((value) => Get.back());
      Get.snackbar("Tizimga muvofaqqiyatli kirildi", "");
    }
    isLoading.value = false;
  }

  Future<void> getAccountDetail() async {
    if (LocalStorage.accessToken != null) {
      var result = await apiClient.getAccountDetails();
      if (result.isSuccessful) {
        userModel(UserModel.fromJson(result.body["data"]));
      }
    }
  }
}
