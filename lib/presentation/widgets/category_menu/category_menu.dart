import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:goals_web/_imports.dart';
import 'package:goals_web/presentation/widgets/category_menu/category_menu_item.dart';


class CategoryMenu extends GetView {
  const CategoryMenu({super.key});

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
          CategoryMenuItem(isSelected: false, onTap: (){}, title: "Matematika"),
          CategoryMenuItem(isSelected: true, onTap: (){}, title: "Ona tili"),
          CategoryMenuItem(isSelected: false, onTap: (){}, title: "Oliy matematika"),
          CategoryMenuItem(isSelected: false, onTap: (){}, title: "Oliy  fa"),
          CategoryMenuItem(isSelected: false, onTap: (){}, title: "Matematika"),
          CategoryMenuItem(isSelected: false, onTap: (){}, title: "Ona tili"),
          CategoryMenuItem(isSelected: false, onTap: (){}, title: "Oliy matematika"),
          CategoryMenuItem(isSelected: false, onTap: (){}, title: "Oliy  fa"),
        ],
      ),
      width: double.infinity,
    );
  }
}
