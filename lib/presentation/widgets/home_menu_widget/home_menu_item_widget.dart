import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goals_web/_imports.dart';

class HomeMenuItemWidget extends StatelessWidget {
  const HomeMenuItemWidget(
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
      padding:EdgeInsets.only(left: 15) ,
      height: 50,
      decoration: BoxDecoration(
          color: !isSelected ? Colors.black.withOpacity(0.3) : Colors.white54,
          border: const Border(bottom: BorderSide(color: AppColors.black))),
      child: InkWell(
          onTap: onTap,
          child: Align(
            alignment: Alignment.centerLeft,
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
