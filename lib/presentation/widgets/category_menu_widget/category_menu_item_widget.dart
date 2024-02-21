import 'package:get/get.dart';
import 'package:goals_web/_imports.dart';
class CategoryMenuItemWidget extends GetView {
  const CategoryMenuItemWidget(      {super.key,
    required this.isSelected,
    required this.onTap,
    required this.title});
  final bool isSelected;
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 40,
      decoration: BoxDecoration(
          color: !isSelected ? AppColors.white : AppColors.green,
          border: const Border(right: BorderSide(color: AppColors.black))),
      child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              title,
              maxLines: 2,
              style: isSelected
                  ? AppTextStyle.categoryMenuWhiteTextStyle
                  : AppTextStyle.categoryMenuBlackTextStyle,
            ),
          )),
    );
  }
}
