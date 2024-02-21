import 'package:goals_web/_imports.dart';
import 'package:flutter/material.dart';
import 'package:goals_web/presentation/widgets/home_menu/home_menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        leading: IconButton(onPressed: (){},icon: Icon(Icons.menu),),
      ),
      body:  Row(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.black)
            ),
            width: 200,
            child: SingleChildScrollView(
                child: HomeMenu()),
          ),
          Expanded(child: Column(children: [

          ],)),
        ],
      ),

    );
  }
}
