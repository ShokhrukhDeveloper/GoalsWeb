import 'package:goals_web/_imports.dart';
import '../../widgets/category_menu_widget/category_menu_widget.dart';
import '../../widgets/category_view_widget/category_view_widget.dart';
import '../../widgets/home_menu_widget/home_menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: double.infinity,
            decoration:
                BoxDecoration(border: Border.all(color: AppColors.black)),
            width: 200,
            child: SingleChildScrollView(child: HomeMenu()),
          ),
           Expanded(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CategoryMenuWidget(),
    LayoutBuilder(
    builder: (context, constraints) {
    if (constraints.maxWidth > 800) {
    // Wide screen layout
    return const SizedBox(width: 800,child: CategoryViewWidget(),);
    } else {
    // Regular screen layout
    return const CategoryViewWidget();
    }}),


              ],
            ),
          )),
        ],
      ),
    );
  }
}
