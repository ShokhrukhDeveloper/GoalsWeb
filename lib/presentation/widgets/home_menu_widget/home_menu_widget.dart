import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:goals_web/_imports.dart';

import 'home_menu_item_widget.dart';


class HomeMenu extends GetView {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          HomeMenuItemWidget(isSelected: false, onTap: () {  }, title: 'Mustaqil ishlar',),
          HomeMenuItemWidget(isSelected: false, onTap: () {  }, title: 'Referatlar',),
          HomeMenuItemWidget(isSelected: true, onTap: () {  }, title: 'Diplom ishlari',),
          HomeMenuItemWidget(isSelected: false, onTap: () {  }, title: 'Slaydlar',),
        ],
      ),
    );
  }
}
