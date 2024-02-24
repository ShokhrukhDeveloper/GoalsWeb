import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:goals_web/_imports.dart';
import 'package:goals_web/controllers/home/home_controller.dart';
import 'package:goals_web/presentation/widgets/add_category_widget/add_button.dart';

import 'category_menu_item_widget.dart';

class CategoryMenuWidget extends GetView<HomeController> {
  const CategoryMenuWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(color: AppColors.black),
        right: BorderSide(color: AppColors.black),
        bottom: BorderSide(color: AppColors.black),
      )),
      width: double.infinity,
      child: Obx(() => Row(
            children: [
              if (controller.selectedCategoryId.value != 0)
                AddButton(onPressed: () {
                  controller.navigatorKey.currentState?.pushNamed(
                      Routes.addSubject,
                      arguments: controller.selectedCategoryId.value);
                }),
              if (controller.selectedSubjects.isNotEmpty)
                ...controller.selectedSubjects
                    .map((e) => CategoryMenuItemWidget(
                        isSelected: controller.selectedSubjectId.value == e.id,
                        onTap: () {
                          controller.selectedSubjectId.value = e.id;
                        },
                        title: e.name)),
            ],
          )),
    );
  }
}
