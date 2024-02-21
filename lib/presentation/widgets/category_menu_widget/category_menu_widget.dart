import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:goals_web/_imports.dart';

import 'category_menu_item_widget.dart';



class CategoryMenuWidget extends GetView {
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
        )
      ),
      child: Row(
        children: [
          CategoryMenuItemWidget(isSelected: false, onTap: (){}, title: "Matematika"),
          CategoryMenuItemWidget(isSelected: true, onTap: (){}, title: "Ona tili"),
          CategoryMenuItemWidget(isSelected: false, onTap: (){}, title: "Oliy matematika"),
          CategoryMenuItemWidget(isSelected: false, onTap: (){}, title: "Oliy  fa"),
          CategoryMenuItemWidget(isSelected: false, onTap: (){}, title: "Matematika"),
          CategoryMenuItemWidget(isSelected: false, onTap: (){}, title: "Ona tili"),
          CategoryMenuItemWidget(isSelected: false, onTap: (){}, title: "Oliy matematika"),
          CategoryMenuItemWidget(isSelected: false, onTap: (){}, title: "Oliy  fa"),
        ],
      ),
      width: double.infinity,
    );
  }
}
