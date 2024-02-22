import 'package:goals_web/_imports.dart';
import 'package:goals_web/presentation/pages/home/widgets/signup_button.dart';
import 'package:goals_web/presentation/widgets/document_view_widget/document_viewer_widget.dart';
import '../../widgets/category_menu_widget/category_menu_widget.dart';
import '../../widgets/category_view_widget/category_view_widget.dart';
import '../../widgets/home_menu_widget/home_menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white.withOpacity(0.2),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          SignUpButton()
        ],
      ),

      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: double.infinity,
            decoration:
                BoxDecoration(border: Border.all(color: AppColors.black)),
            width: 200,
            child: const SingleChildScrollView(child: HomeMenu()),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CategoryMenuWidget(),
                LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    // Wide screen layout
                    return  SizedBox(
                      width: 800,
                      child: DocumentViewerWidget(),
                    );
                  } else {
                    // Regular screen layout
                    return  DocumentViewerWidget();
                  }
                }),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
