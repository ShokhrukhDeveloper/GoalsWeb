import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:goals_web/_imports.dart';
import 'package:goals_web/controllers/auth_controller.dart';
import 'package:goals_web/controllers/home/home_controller.dart';

import '../add_category_widget/add_button.dart';
import 'home_menu_item_widget.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      // if (controller.isLoading.value) {
      //   return const Center(
      //     child: CircularProgressIndicator(),
      //   );
      // }
      return Column(
        children: [
          Container(
            // width: double.infinity,

            decoration: BoxDecoration(
                color: Colors.white10, border: Border.all(color: Colors.black)),
            child: const Padding(
              padding: EdgeInsets.all(30.0),
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
          if (controller.category != null &&
              controller.category!.categories.isNotEmpty)
            Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.category?.categories
                          .map<Widget>((e) => HomeMenuItemWidget(
                                isSelected:
                                    controller.selectedCategoryId.value == e.id,
                                onTap: () {
                                  controller.selectedSubjects.value =
                                      e.subjects;
                                  controller.selectedCategory = e;
                                  controller.selectedCategoryId.value = e.id;
                                  controller.navigatorKey.currentState
                                      ?.pushNamedAndRemoveUntil(
                                          Routes.subjectView, (t) => true);
                                  controller.update();
                                },
                                title: e.name,
                              ))
                          .toList() ??
                      [],
                )),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => AuthController.userModel.value?.role == 0
                ? AddButton(
                    onPressed: () {
                      controller.navigatorKey.currentState
                          ?.pushNamed(Routes.addCategory);
                    },
                  )
                : const SizedBox(),
          )
        ],
      );
    });
  }
}
