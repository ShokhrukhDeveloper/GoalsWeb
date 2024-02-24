import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:goals_web/_imports.dart';
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
      if (controller.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Container(
        child: Obx(() => Column(
              children: [
                ...?controller.category?.categories
                    .map<Widget>((e) => HomeMenuItemWidget(
                          isSelected:
                              controller.selectedCategoryId.value == e.id,
                          onTap: () {
                            controller.selectedSubjects.value = e.subjects;
                            controller.selectedSubjects;
                            controller.selectedCategoryId.value = e.id;
                            controller.update();
                          },
                          title: e.name,
                        ))
                    .toList(),
                SizedBox(height: 10,),
                AddButton(onPressed: () {  },)
              ],
            )),
      );
    });
  }
}
