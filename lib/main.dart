import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:goals_web/presentation/pages/home/home_page.dart';
import 'package:goals_web/routes/app_pages.dart';
import 'package:goals_web/routes/app_routes.dart';
import 'bindings/home_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mod uz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: HomeBindings(),
      initialRoute: Routes.main,
      getPages:AppPages.pages,
      home:   HomePage(),
    );
  }
}

