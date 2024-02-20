import 'package:get/get.dart';
import '../presentation/pages/home/home_page.dart';
import 'app_routes.dart';
class AppPages {
  static final pages = [
    GetPage(name: Routes.main,
        page:()=>const HomePage()),
  ];
}