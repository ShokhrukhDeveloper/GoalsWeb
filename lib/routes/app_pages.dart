import 'package:get/get.dart';
import 'package:goals_web/presentation/pages/sign_in_up/sign_in_page.dart';
import '../presentation/pages/home/home_page.dart';
import 'app_routes.dart';
class AppPages {
  static final pages = [
    GetPage(name: Routes.main,
        page:()=> HomePage()),
    GetPage(name: Routes.sigIn,
        page:()=> const SignInPage()),
  ];
}