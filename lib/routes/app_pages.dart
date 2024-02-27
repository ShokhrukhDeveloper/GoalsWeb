import 'package:get/get.dart';
import 'package:goals_web/bindings/auth_binding.dart';
import 'package:goals_web/presentation/pages/account/account_info_widget.dart';
import 'package:goals_web/presentation/pages/account/account_page.dart';
import 'package:goals_web/presentation/pages/sign_in_up/sign_in_page.dart';
import '../presentation/pages/home/home_page.dart';
import 'app_routes.dart';
class AppPages {
  static final pages = [
    GetPage(name: Routes.main,
        page:()=> HomePage()),
    GetPage(name: Routes.accountInfo,
        page:()=> const AccountPage()),
    GetPage(name: Routes.sigIn,
        binding: AuthBinding(),
        page:()=> const SignInPage()),
  ];
}