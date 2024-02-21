import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goals_web/_imports.dart';

class HomeMenuItem extends StatelessWidget {
  const HomeMenuItem(
      {super.key,
      required this.isSelected,
      required this.onTap,
      required this.title});
  final bool isSelected;
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
          color: !isSelected ? AppColors.white : AppColors.red,
          border: const Border(bottom: BorderSide(color: AppColors.black))),
      child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              title,
              maxLines: 2,
              style: isSelected
                  ? AppTextStyle.homeMenuWhiteTextStyle
                  : AppTextStyle.homeMenuBlackTextStyle,
            ),
          )),
    );
  }
}
