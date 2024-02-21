import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:goals_web/_imports.dart';
import 'package:goals_web/presentation/widgets/home_menu/home_menu_item.dart';

class HomeMenu extends GetView {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          HomeMenuItem(isSelected: false, onTap: () {  }, title: 'Mustaqil ishlar',),
          HomeMenuItem(isSelected: false, onTap: () {  }, title: 'Referatlar',),
          HomeMenuItem(isSelected: true, onTap: () {  }, title: 'Diplom ishlari',),
          HomeMenuItem(isSelected: false, onTap: () {  }, title: 'Slaydlar',),
        ],
      ),
    );
  }
}
